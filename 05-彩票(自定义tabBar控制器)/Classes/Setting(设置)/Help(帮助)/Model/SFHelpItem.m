//
//  SFHelpItem.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFHelpItem.h"

@implementation SFHelpItem

+ (instancetype)itemWithDict:(NSDictionary *)dic {

    SFHelpItem *item = [[self alloc] init];
    [item setValuesForKeysWithDictionary:dic];
    
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
