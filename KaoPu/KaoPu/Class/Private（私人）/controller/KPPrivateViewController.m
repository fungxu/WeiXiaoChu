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
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self addChildViewController:self.toolVc];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem RightItemWithTarget:self action:@selector(more) image:@"01-更多图标" highlightedimage:@"未标题-3_05"];
}

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

- (void)setContent{
    int count = 7;
    CGFloat viewW = [UIScreen mainScreen].bounds.size.width;
    CGFloat viewH = 84.5;
    CGFloat viewX = 0;
    
    UIScrollView *sc = [[UIScrollView alloc] init];
    sc.frame = self.view.bounds;
    sc.contentInset = UIEdgeInsetsMake(0, 0, 64, 0);
    sc.contentSize = CGSizeMake(self.view.width, viewH * count);
    sc.backgroundColor = [UIColor blueColor];
    [self.view addSubview:sc];
    
    for (int i = 0; i<count; i++) {
        KPCustomWeek *view = [[KPCustomWeek alloc] init];
        [view setTitle:self.weeks[i]];
        view.backgroundColor = [UIColor redColor];
        view.frame = CGRectMake(viewX, viewH *i, viewW, viewH);
        [sc addSubview:view];
    }
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:1 animations:^{
        self.toolVc.view.x = [UIScreen mainScreen].bounds.size.width;
    }];
}



@end
