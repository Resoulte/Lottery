//
//  SFLuckyBGView.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/13.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFLuckyBGView.h"

@implementation SFLuckyBGView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"luck_entry_background"];
    [image drawInRect:rect];
}


@end
