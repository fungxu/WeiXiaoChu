//
//  KPCustomTitleView.m
//  KaoPu
//
//  Created by 颜黎明 on 15/8/1.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPCustomTitleView.h"

@implementation KPCustomTitleView

+ (instancetype)titleView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
