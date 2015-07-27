//
//  KPClassifyViewController.m
//  KaoPu
//
//  Created by zuo on 15/7/27.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPClassifyViewController.h"

@interface KPClassifyViewController ()

@end

@implementation KPClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置Nav标题和按钮
    [self setupNav];
}

#pragma mark - 1.设置Nav标题和按钮
- (void)setupNav
{
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem LeftItemWithTarget:self action:@selector(back) image:@"返回箭头_02" highlightedimage:@"未标题-3_02"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem RightItemWithTarget:self action:@selector(more) image:@"01-更多图标" highlightedimage:@"未标题-3_05"];
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
