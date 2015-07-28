//
//  KPRecommendViewController.m
//  KaoPu
//
//  Created by zuo on 15/7/27.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPRecommendViewController.h"
#import "KPShowViewController.h"

@interface KPRecommendViewController ()
/** 内容View */
@property (nonatomic, weak)UIScrollView *ContentView;
@end

@implementation KPRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置Nav标题和按钮
    [self setupNav];
    
    // 2.添加内容View
    [self addContentView];
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

#pragma mark - 2.添加内容View
- (void)addContentView
{
    UIScrollView *ContentView = [[UIScrollView alloc] init];
    ContentView.backgroundColor = KPColor(228, 228, 228);
    ContentView.frame = self.view.bounds;
    
    [self.view addSubview:ContentView];
    
    // 添加内部按钮
    NSArray *PicArray = @[@"01-01图_02", @"01-02图片_02", @"01-03图片_02"];
    NSInteger count = PicArray.count;
    CGFloat magrin = 10;
    CGFloat btnH = 0;
    
    for (NSInteger i = 0; i < count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = i;
        [btn setImage:[UIImage imageNamed:PicArray[i]] forState:UIControlStateNormal];
        btn.size = btn.currentImage.size;
        btn.x = 0;
        btn.y = i * (btn.size.height + magrin) + magrin;
        btnH = (btn.size.height + magrin);
        [btn addTarget:self action:@selector(MenuButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [ContentView addSubview:btn];
    }
    
    
    // 设置ContentView的属性
    ContentView.contentSize = CGSizeMake(0, count * btnH);
    CGFloat bottom = CGRectGetMaxY(self.navigationController.navigationBar.frame) + magrin;
    ContentView.contentInset = UIEdgeInsetsMake(0, 0, bottom, 0);
    
}
- (void)MenuButtonClick:(UIButton *)button
{
    [UIView animateWithDuration:0.25 animations:^{
        button.transform = CGAffineTransformScale(button.transform, 2, 2);
        button.alpha = 0;
    } completion:^(BOOL finished) {
        button.transform = CGAffineTransformIdentity;
        button.alpha = 1;
        KPShowViewController *showVc = [[KPShowViewController alloc] init];
        showVc.type = button.tag;
        [self.navigationController pushViewController:showVc animated:NO];
    }];
    
    
}

#pragma mark - 系统方法
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}






@end
