//
//  KPShowViewController.h
//  KaoPu
//
//  Created by zuo on 15/7/28.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    KPShowViewControllerTypeBreakfast = 0,
    KPShowViewControllerTypeCoarse = 1,
    KPShowViewControllerTypeHome = 2,
} KPShowViewControllerType;

@interface KPShowViewController : UIViewController
/** 类型 */
@property (nonatomic, assign)KPShowViewControllerType type;
@end
