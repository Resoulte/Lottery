//
//  SFSettingItem.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFSettingItem.h"

@implementation SFSettingItem

+ (instancetype)itemImage:(UIImage *)image title:(NSString *)title {

    SFSettingItem *item = [[self alloc] init];
    item.iconImage = image;
    item.title = title;
    
    return item;
}

@end
