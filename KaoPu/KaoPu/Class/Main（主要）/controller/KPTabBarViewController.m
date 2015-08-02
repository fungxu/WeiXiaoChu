//
//  KPTabBarViewController.m
//  KaoPu
//
//  Created by zuo on 15/7/27.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPTabBarViewController.h"
#import "KPNavigationViewController.h"
#import "KPRecommendViewController.h"
#import "KPPrivateViewController.h"
#import "KPClassifyViewController.h"
#import "KPMineViewController.h"

@interface KPTabBarViewController ()

@end

@implementation KPTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.添加子控制器
    [self addChildViewControllers];
}

#pragma mark - 1.添加子控制器
- (void)addChildViewControllers
{
    // 1.推荐
    KPRecommendViewController *RecommendVc = [[KPRecommendViewController alloc] init];
    [self addChildViewController:RecommendVc title:@"推荐" image:@"底部条切图_15" selectimage:@"底部条切图_03"];
    // 2.分类
    KPClassifyViewController *ClassifyVc = [[KPClassifyViewController alloc] init];
    [self addChildViewController:ClassifyVc title:@"分类" image:@"底部条切图_16" selectimage:@"底部条切图_05"];
    // 3.私人定制
    KPPrivateViewController *PrivateVc = [[KPPrivateViewController alloc] init];
    [self addChildViewController:PrivateVc title:@"私人定制" image:@"底部条切图_17" selectimage:@"底部条切图_07"];
    // 4.我
    KPMineViewController *MineVc = [[KPMineViewController alloc] init];
    [self addChildViewController:MineVc title:@"我" image:@"底部条切图_18" selectimage:@"底部条切图_09"];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectimage:(NSString *)selectimage;
{
    [childController.tabBarItem setTitle:title];
    // 文字
    NSDictionary *normaldict = @{NSForegroundColorAttributeName:KPColor(135, 135, 135)};
    NSDictionary *selectdict = @{NSForegroundColorAttributeName:KPColor(219, 71, 88)};
    [childController.tabBarItem setTitleTextAttributes:normaldict forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:selectdict forState:UIControlStateSelected];
    // 图片
    childController.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectimage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    KPNavigationViewController *NavVc = [[KPNavigationViewController alloc] initWithRootViewController:childController];
    [self addChildViewController:NavVc];
}

@end
