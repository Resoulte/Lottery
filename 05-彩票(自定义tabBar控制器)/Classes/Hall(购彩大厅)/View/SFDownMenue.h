//
//  SFDownMenue.h
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/7/26.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFDownMenue : UIView

+ (instancetype)showInView:(UIView *)superView items:(NSArray *)items origionY:(CGFloat)origionY;

- (void)hide;
@end
