//
//  SFMenueItem.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/7/26.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFMenueItem.h"

@implementation SFMenueItem

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title {

    SFMenueItem *item = [[self alloc] init];
    item.image = image;
    item.title = title;
    
    return item;
}

@end
