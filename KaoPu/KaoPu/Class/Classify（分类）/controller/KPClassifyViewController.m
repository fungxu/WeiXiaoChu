//
//  KPClassifyViewController.m
//  KaoPu
//
//  Created by zuo on 15/7/27.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPClassifyViewController.h"
#import "KPClassify.h"
#import "KPClassifyViewCell.h"
#import "MJExtension.h"
#import "KPDetailClassifyViewController.h"
#import "AFNetworking.h"

@interface KPClassifyViewController ()

/** classifies */
@property (strong, nonatomic) NSArray *classifies;

@end

@implementation KPClassifyViewController


- (instancetype)init
{
    //流水布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置item尺寸
    layout.itemSize = CGSizeMake(100, 120);
    //设置每个item之间的间距
    //layout.minimumInteritemSpacing = 0;
    //设置行距
    layout.minimumLineSpacing = 10;
    
    return [super initWithCollectionViewLayout:layout];
}


static NSString * const reuseIdentifier = @"Cell";

- (NSArray *)classifies {
    
    if (_classifies == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"classifies.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        _classifies = [KPClassify objectArrayWithKeyValuesArray:array];
        
    }
    
    return _classifies;
}


- (void)loadClassifyData {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"key"] = @"fb26de051cf1b25a7f0e2b3e9d542ff8";
    
    [[AFHTTPSessionManager manager] GET:@"http://apis.juhe.cn/cook/category" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        
        [responseObject writeToFile:@"/Users/laichunhui/Desktop/plist调试/65.plist" atomically:YES];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置Nav标题和按钮
    [self setupNav];
    
    self.collectionView.backgroundColor = [UIColor cyanColor];
    
    
    self.collectionView.bounces = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    
    //注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"KPClassifyViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    
}

#pragma mark - 1.设置Nav标题和按钮
- (void)setupNav
{
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem LeftItemWithTarget:self action:@selector(back) image:@"返回箭头_02" highlightedimage:@"未标题-3_02"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem RightItemWithTarget:self action:@selector(more) image:@"01-更多图标" highlightedimage:@"未标题-3_05"];
}




#pragma mark - datasource method and delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.classifies.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KPClassifyViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    KPClassify *classify = self.classifies[indexPath.row];
    
    cell.classify = classify;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    KPClassify *classify = self.classifies[indexPath.row];
    KPDetailClassifyViewController *detailVc = [[KPDetailClassifyViewController alloc] init];
    
    detailVc.classify = classify.name;
    [self.navigationController pushViewController:detailVc animated:YES];
}


- (void)back
{
    NSLog(@"%s", __func__);
}
- (void)more
{
    NSLog(@"%s", __func__);
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
