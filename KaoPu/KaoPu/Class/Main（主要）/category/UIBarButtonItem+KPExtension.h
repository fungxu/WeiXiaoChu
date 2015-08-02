//
//  UIBarButtonItem+KPExtension.h
//  大神微博1
//
//  Created by zuo on 15/6/13.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (KPExtension)
+ (UIBarButtonItem *)LeftItemWithTarget:(id)target action :(SEL)action image:(NSString *)image highlightedimage:(NSString *)highlightedimage;
+ (UIBarButtonItem *)RightItemWithTarget:(id)target action :(SEL)action image:(NSString *)image highlightedimage:(NSString *)highlightedimage;
@end

