//
//  SFCover.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/7/24.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFCover.h"

@implementation SFCover

+ (void)show {

    SFCover *cover = [[SFCover alloc] initWithFrame:SFScreenBounds];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.6;
    
    // 要显示到最前面就添加到主窗口
    [SFKeyWindow addSubview:cover];
}

+ (void)hide {

    for (UIView *childView in SFKeyWindow.subviews) {
        if ([childView isKindOfClass:self]) {
            
            [childView removeFromSuperview];
        }
    }
}
@end
