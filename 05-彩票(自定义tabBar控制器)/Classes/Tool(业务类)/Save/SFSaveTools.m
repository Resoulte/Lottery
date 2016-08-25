//
//  SFSaveTools.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/16.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFSaveTools.h"

@implementation SFSaveTools

+ (id)objectForKey:(NSString *)defaultName {
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

+ (void)setObject:(id)value forKey:(NSString *)defaultName {
    
    [[NSUserDefaults standardUserDefaults] setObject:defaultName forKey:defaultName];
    
}

@end
