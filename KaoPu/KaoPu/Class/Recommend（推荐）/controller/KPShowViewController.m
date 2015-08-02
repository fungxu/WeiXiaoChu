//
//  KPShowViewController.m
//  KaoPu
//
//  Created by zuo on 15/7/28.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPShowViewController.h"
#import "KPShowViewCell.h"
#import "AFNetworking.h"
#import "KPDish.h"
#import "KPDishStep.h"
#import "MJExtension.h"
#import <SVProgressHUD.h>

@interface KPShowViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *contentCollectionView;
@property (weak, nonatomic) IBOutlet UIButton *loadMoreButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;




/** titleName */
@property (nonatomic, strong)NSString *titleName;
/** dishes */
@property (nonatomic, strong)NSArray *dishes;
@end

@implementation KPShowViewController

static NSString *const KPCollectionViewCellIdentifier = @"cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.初始化
    [self setup];
    
    // 2.设置contentCollectionView属性
    [self setupContentCollectionView];
    
    // 3.获得菜品数据
    [self getDishInfo];
    
}
- (IBAction)change:(id)sender
{
    self.loadMoreButton.enabled = NO;
    self.activity.hidden = NO;
}

#pragma mark - 1.初始化
- (void)setup
{
    self.view.backgroundColor = KPColor(228, 228, 228);
    
    switch (self.type) {
        case KPShowViewControllerTypeBreakfast:
            self.titleName = @"精选早餐";
            break;
            
        case KPShowViewControllerTypeCoarse:
            self.titleName = @"粗粮烘焙";
            break;
            
        case KPShowViewControllerTypeHome:
            self.titleName = @"家常盛宴";
            break;
            
        default:
            break;
    }
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = self.titleName;
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.height = 30;
    self.navigationItem.titleView = titleLabel;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem LeftItemWithTarget:self action:@selector(back) image:@"返回箭头_02" highlightedimage:@"未标题-3_02"];
    
    // 设置控件的显示状态
    self.activity.hidden = YES;
    
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 2.设置contentCollectionView属性
- (void)setupContentCollectionView
{
    // contentCollectionView的设置
    self.contentCollectionView.dataSource = self;
    self.contentCollectionView.delegate = self;
    [self.contentCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([KPShowViewCell class]) bundle:nil] forCellWithReuseIdentifier:KPCollectionViewCellIdentifier];
    
    [KPDish setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"steps" : @"KPDishStep",
                 };
    }];
}

#pragma mark - 3.获得菜品数据
- (void)getDishInfo
{
    [SVProgressHUD showWithStatus:@"加载中"];
    /**
     *  接口地址：http://apis.juhe.cn/cook/index
     支持格式：JSON/XML
     请求方式：HTTP GET/POST
     请求示例：http://apis.juhe.cn/cook/index?key=您申请的KEY&cid=1
     接口备注：按标签检索菜谱
     
     cid	int	是	标签ID
     key	string	是	应用APPKEY(应用详细页查询)
     dtype	string	否	返回数据的格式,xml或json，默认json
     pn	string	否	数据返回起始下标，默认0
     rn	string	否	数据返回条数，最大30，默认10
     format	string	否	steps字段屏蔽，默认显示，format=1时屏蔽
     */
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"cid"] = @"37";
    param[@"key"] = @"812c02038a5ff9888333562d8ac4d389";
    param[@"rn"] = @"10";
    
    [mgr GET:@"http://apis.juhe.cn/cook/index" parameters:param success:^(NSURLSessionDataTask *task, id responseObject) {
        
        self.dishes = [KPDish objectArrayWithKeyValuesArray:responseObject[@"result"][@"data"]];
        
        [self.contentCollectionView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
    }];
}


#pragma mark - 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dishes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KPShowViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KPCollectionViewCellIdentifier forIndexPath:indexPath];
    
    cell.dish = self.dishes[indexPath.item];
    
    return cell;
}

#pragma mark - 代理方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s", __func__);
}

@end
