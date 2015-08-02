//
//  KPShowViewCell.m
//  KaoPu
//
//  Created by zuo on 15/7/28.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPShowViewCell.h"
#import "KPDish.h"

@interface KPShowViewCell ()
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *imtroLabel;
/** 标签View */
@property (weak, nonatomic) IBOutlet UIView *tagsView;
/** 用料View */
@property (weak, nonatomic) IBOutlet UIView *burdenView;
/** 调料View */
@property (weak, nonatomic) IBOutlet UIView *ingredientsView;

@end

@implementation KPShowViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setDish:(KPDish *)dish
{
    _dish = dish;
    
    // 布局子控件
    self.titleLabel.text = dish.title;
    self.imtroLabel.text = dish.imtro;
    
//    CGFloat height = CGRectGetMaxY(self.ingredientsView.frame);
    self.contentScrollView.contentSize = CGSizeMake(0, 1000);
}

@end
