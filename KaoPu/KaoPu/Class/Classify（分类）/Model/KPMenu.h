//
//  KPMenu.h
//  KaoPu
//
//  Created by laichunhui on 15/8/1.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KPMenu : NSObject

/** albums */
@property (strong, nonatomic) NSArray *albums;

/** id */
@property (copy, nonatomic) NSString *ID;

/** steps */
@property (strong, nonatomic) NSArray *steps;

/** id */
@property (copy, nonatomic) NSString *tags;

/** title */
@property (copy, nonatomic) NSString *title;
@end
