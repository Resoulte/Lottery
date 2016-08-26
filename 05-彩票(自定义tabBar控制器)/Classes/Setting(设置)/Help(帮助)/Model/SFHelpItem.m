//
//  SFHelpItem.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFHelpItem.h"
#import "NSObject+SFModel.h"

@implementation SFHelpItem

+ (instancetype)itemWithDict:(NSDictionary *)dic {
    SFHelpItem *item = [[self alloc] init];
    [item setValuesForKeysWithDictionary:dic];
//    //. kvc  遍历字典里所以得key去模型中找
    
//    SFHelpItem *item = [SFHelpItem objcWithDic:dic mapDict:@{@"ID" : @"id"}];
    
//    runtime
    // 遍历模型中属性名去字典中找，如果找到就赋值
    
    return item;
}

- (void)setValue:(id)value forKey:(NSString *)key {

    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"ID"];
    } else {
    
        [super setValue:value forKey:key];
    }
}

@end
