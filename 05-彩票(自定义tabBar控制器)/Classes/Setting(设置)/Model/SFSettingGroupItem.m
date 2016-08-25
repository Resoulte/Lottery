//
//  SFSettingGroupItem.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFSettingGroupItem.h"

@implementation SFSettingGroupItem

+ (instancetype)items:(NSArray *)items { // HeadTitle:(NSString *)headTitle footTitle:(NSString *)footTitle {

    SFSettingGroupItem *groupItem = [[self alloc] init];
//    groupItem.headTitle = headTitle;
//    groupItem.footTitle = footTitle;
    
    groupItem.items = items;
    return groupItem;
}

@end
