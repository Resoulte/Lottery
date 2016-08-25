//
//  SFTitleView.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/13.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFTitleView.h"

@implementation SFTitleView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.imageView.x < self.titleLabel.x) {
        self.titleLabel.x = self.imageView.x;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {

    [super setTitle:title forState:state];
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state {

    [super setImage:image forState:state];
    [self sizeToFit];
}


@end
