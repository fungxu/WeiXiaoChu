//
//  KPDetailClassifyCell.m
//  KaoPu
//
//  Created by laichunhui on 15/7/28.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPDetailClassifyCell.h"
#import "UIImageView+WebCache.h"
#import "KPMenu.h"
@interface KPDetailClassifyCell()

@property (weak, nonatomic) IBOutlet UIImageView *albumView;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *stepsAndTimeLB;
@property (weak, nonatomic) IBOutlet UILabel *tagsLB;

@end

@implementation KPDetailClassifyCell

- (void)awakeFromNib {
    self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0  blue:240/255.0  alpha:1.0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMenu:(KPMenu *)menu {
    _menu = menu;
    //图片
    [self.albumView sd_setImageWithURL:[NSURL URLWithString:menu.albums[0]] placeholderImage:nil];
    
    self.titleLB.text = menu.title;
    
    self.stepsAndTimeLB.text =[NSString stringWithFormat:@"%zd", menu.steps.count];
    
    self.tagsLB.text = menu.tags;
}

@end
