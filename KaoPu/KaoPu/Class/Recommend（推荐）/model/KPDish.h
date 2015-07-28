//
//  KPDish.h
//  KaoPu
//
//  Created by zuo on 15/7/28.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KPDish : NSObject
/** 存放图片模型的数组 */
@property (nonatomic, strong)NSArray *albums;
/** 存放菜品具体步骤的数组 */
@property (nonatomic, strong)NSArray *steps;

/** 菜品所需材料 */
@property (nonatomic, copy)NSString *burden;
/** 菜品描述 */
@property (nonatomic, copy)NSString *imtro;
/** 原料 */
@property (nonatomic, copy)NSString *ingredients;
/** 标签 */
@property (nonatomic, copy)NSString *tags;
/** 标题 */
@property (nonatomic, copy)NSString *title;
@end
