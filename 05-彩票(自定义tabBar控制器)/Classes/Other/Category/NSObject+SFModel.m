//
//  NSObject+SFModel.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "NSObject+SFModel.h"
#import <objc/runtime.h>

@implementation NSObject (SFModel)

+ (instancetype)objcWithDic:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict {
    
    id objc = [[self alloc] init];
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(self, &count);
    for (int i; i < count; i ++) {
        Ivar ivar = ivars[i];
        // 属性名字
        NSString *ivarName = @(ivar_getName(ivar));
        ivarName = [ivarName substringFromIndex:1];
        id value = dict[ivarName];
        
        // 需要有外界通知内部，模型中属性名对应字典里面的那个key
        // ID -> id
        if (value == nil) {
            if (mapDict) {
               NSString *keyName = mapDict[ivarName];
                value = dict[keyName];
            }
        }
        
        [objc setValue:value forKeyPath:ivarName];
//        SFLog(@"%@, %@", ivarName , value);
    }
    
    return objc;
}


@end
