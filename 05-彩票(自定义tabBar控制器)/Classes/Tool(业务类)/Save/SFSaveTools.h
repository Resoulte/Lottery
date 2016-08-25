//
//  SFSaveTools.h
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/16.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFSaveTools : NSObject

+ (id)objectForKey:(NSString *)defaultName;

+ (void)setObject:(id)value forKey:(NSString *)defaultName;



@end
