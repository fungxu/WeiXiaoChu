//
//  KPRecommendViewController.m
//  KaoPu
//
//  Created by zuo on 15/7/27.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPRecommendViewController.h"

@interface KPRecommendViewController ()

@end

@implementation KPRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置Nav标题和按钮
    [self setupNav];
    
    NSLog(@"%s", __func__);
}

#pragma mark - 1.设置Nav标题和按钮
- (void)setupNav
{
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"每日推荐";
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.height = 30;
    self.navigationItem.titleView = titleLabel;
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem RightItemWithTarget:self action:@selector(more) image:@"01-更多图标" highlightedimage:@"未标题-3_05"];
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
