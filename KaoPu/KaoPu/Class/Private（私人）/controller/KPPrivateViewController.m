//
//  KPPrivateViewController.m
//  KaoPu
//
//  Created by zuo on 15/7/27.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPPrivateViewController.h"
#import "KPToolViewController.h"
#import "KPCustomWeek.h"
#import "KPCustomTitleView.h"
@interface KPPrivateViewController ()

/** <#描述#> */
@property (strong,nonatomic) KPToolViewController * toolVc;

/** 星期 */
@property (strong,nonatomic) NSArray * weeks;

@end

@implementation KPPrivateViewController

-(NSArray *)weeks{
    if (!_weeks) {
        _weeks = @[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天"];
    }
    return _weeks;
}

-(KPToolViewController *)toolVc{
    if (!_toolVc) {
        _toolVc = [[KPToolViewController alloc] init];
    }
    return _toolVc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置Nav标题和按钮
    [self setupNav];
    
    [self setContent];
    
    self.view.backgroundColor = KPColor(255, 251, 240);
}

#pragma mark - 1.设置Nav标题和按钮
- (void)setupNav
{
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"私人定制";
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.height = 30;
    self.navigationItem.titleView = titleLabel;
    
    [self addChildViewController:self.toolVc];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem RightItemWithTarget:self action:@selector(more) image:@"01-更多图标" highlightedimage:@"未标题-3_05"];
}

#pragma mark点击右边导航栏按钮
- (void)more
{
    [self.view addSubview:self.toolVc.view];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    self.toolVc.view.width = 100;
    
    CGFloat toolX = 0;
    
    toolX = (self.toolVc.view.x == width)?(width -100):width;
    
    
    [UIView animateWithDuration:1 animations:^{
        self.toolVc.view.x = toolX;
    }];
}

#pragma mark填充内容数据
- (void)setContent{
    int count = 7;
    
    CGFloat titleH = 64;
    CGFloat weekH = 84.5;
    //初始化UIScrollView
    UIScrollView *sc = [[UIScrollView alloc] init];
    sc.frame = self.view.bounds;
    sc.contentInset = UIEdgeInsetsMake(0, 0, 64, 0);
    sc.contentSize = CGSizeMake(self.view.width, weekH * count + titleH);
    [self.view addSubview:sc];
    
    //初始化标题
    KPCustomTitleView *titleView = [KPCustomTitleView titleView];
    titleView.height = titleH;
    titleView.width = [UIScreen mainScreen].bounds.size.width;
    titleView.backgroundColor = [UIColor clearColor];
    [sc addSubview:titleView];
    
    //初始化内容
    CGFloat weekW = [UIScreen mainScreen].bounds.size.width;
    CGFloat weekX = 0;
    for (int i = 0; i<count; i++) {
        KPCustomWeek *view = [[KPCustomWeek alloc] init];
        [view setTitle:self.weeks[i]];
        view.frame = CGRectMake(weekX, weekH *i + titleH, weekW, weekH);
        [sc addSubview:view];
    }
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:1 animations:^{
        self.toolVc.view.x = [UIScreen mainScreen].bounds.size.width;
    }];
}



@end
