//
//  UIBarButtonItem+KPExtension.m
//  大神微博1
//
//  Created by zuo on 15/6/13.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "UIBarButtonItem+KPExtension.h"

@implementation UIBarButtonItem (KPExtension)
+ (UIBarButtonItem *)LeftItemWithTarget:(id)target action :(SEL)action image:(NSString *)image highlightedimage:(NSString *)highlightedimage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedimage] forState:UIControlStateHighlighted];
    btn.size = btn.currentImage.size;
    [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)RightItemWithTarget:(id)target action :(SEL)action image:(NSString *)image highlightedimage:(NSString *)highlightedimage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedimage] forState:UIControlStateHighlighted];
    btn.size = btn.currentImage.size;
    [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -15)];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
