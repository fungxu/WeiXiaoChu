//
//  KPCustomWeekTitle.m
//  KaoPu
//
//  Created by 颜黎明 on 15/7/28.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPCustomWeekTitle.h"

@interface KPCustomWeekTitle ()

/** <#描述#> */
@property (strong,nonatomic) UIImageView * backgroud;

/** <#描述#> */
@property (strong,nonatomic) UILabel * weekLable;

@end

@implementation KPCustomWeekTitle

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *backgroud = [[UIImageView alloc] init];
        backgroud.image = [UIImage imageNamed:@"03-星期底图_03"];
        self.backgroud = backgroud;
        
        UILabel *weekLable = [[UILabel alloc] init];
        weekLable.font = [UIFont systemFontOfSize:14];
        weekLable.numberOfLines = 0;
        self.weekLable = weekLable;
        
        [self addSubview:backgroud];
        [self addSubview:weekLable];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.backgroud.frame = self.bounds;
    self.backgroud.height -=1;
    
    self.weekLable.height = self.height;
    self.weekLable.width = 15;
    self.weekLable.center = CGPointMake(self.width/2, self.height/2);
    
}

- (void)setTitle:(NSString *)title{
    self.weekLable.text = title;
}

@end
