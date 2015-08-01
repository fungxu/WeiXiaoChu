//
//  KPCustomFoot.m
//  KaoPu
//
//  Created by 颜黎明 on 15/8/1.
//  Copyright (c) 2015年 zuo. All rights reserved.
//

#import "KPCustomFood.h"

@interface KPCustomFood ()

@end

@implementation KPCustomFood

+ (instancetype)food{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

//-(void)setImage:(UIImage *)image{
//    _image = image;
//    self.imageView.image = image;
//}
- (IBAction)delfood:(id)sender {
    //移除当前控件
//    [self removeFromSuperview];
    
    //通知外界  重新更新布局
    if ([self.delegate respondsToSelector:@selector(kpCustomFoodDidRemoveFromSuperview:)]) {
        [self.delegate kpCustomFoodDidRemoveFromSuperview:self];
    }

}
@end
