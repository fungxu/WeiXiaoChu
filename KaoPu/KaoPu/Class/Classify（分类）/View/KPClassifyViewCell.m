//
//  KPClassifyViewCell.m
//  KaoPu
//
//  Created by laichunhui on 15/7/28.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPClassifyViewCell.h"
#import "KPClassify.h"

@interface KPClassifyViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *classNameLabel;

@end

@implementation KPClassifyViewCell

- (void)setClassify:(KPClassify *)classify {
    _classify = classify;
    self.iconView.image = [UIImage imageNamed:classify.icon];
    self.classNameLabel.text = classify.name;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
