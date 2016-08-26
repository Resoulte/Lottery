//
//  NSObject+SFModel.h
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SFModel)

// mapDict:模型中的那个属性名跟字典里面的key对应
+ (instancetype)objcWithDic:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict;


@end
