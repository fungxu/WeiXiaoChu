//
//  KPCustomWeek.m
//  KaoPu
//
//  Created by 颜黎明 on 15/7/28.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPCustomWeek.h"
#import "KPCustomWeekTitle.h"
#import "KPCustomWeekScrollView.h"
@interface KPCustomWeek ()

/** 标题 */
@property (strong,nonatomic) KPCustomWeekTitle * titleView;

/** 内容 */
@property (strong,nonatomic) KPCustomWeekScrollView * weekScrollView;

@end

@implementation KPCustomWeek

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        KPCustomWeekTitle *titleView= [[KPCustomWeekTitle alloc] init];
        self.titleView = titleView;
        [self addSubview:titleView];
        
        KPCustomWeekScrollView *weekScrollView = [[KPCustomWeekScrollView alloc] init];
        self.weekScrollView = weekScrollView;
        [self addSubview:weekScrollView];
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.titleView.width = 37.5;
    self.titleView.height = self.height;
    
    self.weekScrollView.x = self.titleView.width;
    self.weekScrollView.height = self.height;
    self.weekScrollView.width = self.width - self.titleView.width;
    
}

- (void)setTitle:(NSString *)title{
    [self.titleView setTitle:title];
}



@end
