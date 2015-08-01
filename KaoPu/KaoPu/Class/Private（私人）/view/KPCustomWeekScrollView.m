//
//  KPCustomWeekScrollView.m
//  KaoPu
//
//  Created by 颜黎明 on 15/7/28.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPCustomWeekScrollView.h"

@interface KPCustomWeekScrollView ()

/** <#描述#> */
@property (strong,nonatomic) NSMutableArray * btns;

@end

@implementation KPCustomWeekScrollView

int btnCount = 0;
-(NSMutableArray *)btns{
    if (!_btns) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        int btnCount = arc4random_uniform(16) + 1;
        for (int i = 0; i < btnCount; i++) {
            UIButton *btn = [[UIButton alloc] init];
            [btn setBackgroundColor:[UIColor grayColor]];
            [btn setImage:[UIImage imageNamed:@"04-小图标_加号"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventEditingDidEnd];
            [self.btns addObject:btn];
            [self addSubview:btn];
        }
    }
    return self;
}

- (void)click{
    NSLog(@"%s",__func__);  
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat width = 100;
    CGFloat heigth = self.height;
    
    self.contentSize = CGSizeMake(width *self.btns.count, heigth);
    
    int index = 0;
    for (UIButton *btn in self.btns) {
        
        btn.frame = CGRectMake(width * index, 0, width, heigth);
        
        index++;
        
    }
}

@end
