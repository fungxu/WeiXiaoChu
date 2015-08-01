//
//  KPCustomWeekScrollView.m
//  KaoPu
//
//  Created by 颜黎明 on 15/7/28.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPCustomWeekScrollView.h"
#import "KPCustomFood.h"
@interface KPCustomWeekScrollView ()<KPCustomFoodDelegate>

/** 数据的控件集合 */
@property (strong,nonatomic) NSMutableArray * foods;

/** <#描述#> */
@property (strong,nonatomic) NSArray * images;

@end

@implementation KPCustomWeekScrollView

int btnCount = 0;
-(NSMutableArray *)foods{
    if (!_foods) {
        _foods = [NSMutableArray array];
    }
    return _foods;
}

-(NSArray *)images{
    if (!_images) {
        _images = @[@"02-菜谱分类图_32",@"02-菜谱分类图_31",@"02-菜谱分类图_30",@"02-菜谱分类图_26",@"02-菜谱分类图_25",@"02-菜谱分类图_24",@"02-菜谱分类图_20"];
    }
    return _images;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        int btnCount = arc4random_uniform(16) + 1;
        for (int i = 0; i < btnCount; i++) {
            KPCustomFood *foodView = [KPCustomFood food];
            foodView.imageView.image = [UIImage imageNamed:self.images[arc4random_uniform((int)self.images.count)]];
            //给按钮添加长按事件
            [foodView addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)]];
            //给按钮添加点击事件
            [foodView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)]];
            
            foodView.delegate = self;
            
            [self.foods addObject:foodView];
            [self addSubview:foodView];
        }
    }
    return self;
}
- (void)longPress:(UILongPressGestureRecognizer *)longpress{
    if (longpress.state == UIGestureRecognizerStateEnded) { //表示长按显示删除按钮
        KPCustomFood *foodView =(KPCustomFood *)longpress.view;
        foodView.delbtn.hidden = !foodView.delbtn.isHidden;
    }
}

- (void)click{
    NSLog(@"%s",__func__);  
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat width = 100;
    CGFloat heigth = self.height;
    
    self.contentSize = CGSizeMake(width *self.foods.count, heigth);
    
    int index = 0;
    for (KPCustomFood *foodView in self.foods) {
        foodView.frame = CGRectMake(width * index, 0, width, heigth);
        index++;
    }
}

-(void)kpCustomFoodDidRemoveFromSuperview:(KPCustomFood *)kpCustomFood{
    [self.foods removeObject:kpCustomFood];
    
    [kpCustomFood removeFromSuperview];

    [self layoutSubviews];
}

@end
