//
//  KPCustomFoot.h
//  KaoPu
//
//  Created by 颜黎明 on 15/8/1.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KPCustomFood;
@protocol KPCustomFoodDelegate <NSObject>

- (void)kpCustomFoodDidRemoveFromSuperview:(KPCustomFood *)kpCustomFood;

@end

@interface KPCustomFood : UIView

+ (instancetype)food;

/** 代理 */
@property (weak,nonatomic) id<KPCustomFoodDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIButton *delbtn;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
