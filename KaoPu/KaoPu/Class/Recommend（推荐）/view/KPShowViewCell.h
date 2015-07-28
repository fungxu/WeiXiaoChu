//
//  KPShowViewCell.h
//  KaoPu
//
//  Created by zuo on 15/7/28.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KPDish;

@interface KPShowViewCell : UICollectionViewCell

/** 模型 */
@property (nonatomic, strong)KPDish *dish;

@end
