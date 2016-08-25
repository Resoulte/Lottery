//
//  SFMenueItem.h
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/7/26.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFMenueItem : NSObject
@property (copy, nonatomic) NSString * title;
@property (strong, nonatomic) UIImage *image;

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title;

@end
