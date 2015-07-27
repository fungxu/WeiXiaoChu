//
//  KPNavigationViewController.m
//  KaoPu
//
//  Created by zuo on 15/7/27.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPNavigationViewController.h"

@interface KPNavigationViewController ()

@end

@implementation KPNavigationViewController

+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
//    [bar setBackgroundColor:KPGlobalColor];
    [bar setBackgroundImage:[UIImage imageNamed:@"02_03"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
