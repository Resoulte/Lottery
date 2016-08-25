//
//  SFGuideTool.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/16.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFGuideTool.h"
#import "SFTabBarController.h"
#import "SFNewfeatureController.h"
#import "SFSaveTools.h"

#define SFVersionKey @"version"


@implementation SFGuideTool

+ (UIViewController *)chooseRootViewController {

    // 判断下有没有最新的版本号
    // 获取用户的最新版本号 info.plist
    NSString *curVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    // 获取上一次的版本号 => 先保存版本号 => 偏好设置保存 => 每次进入新特性的界面的时候，表示有最新的版本号，着时候才需要保存
    
    // 获取上一次的版本号 (偏好设置)
    NSString *oldVersion = [[NSUserDefaults standardUserDefaults] objectForKey:SFVersionKey];
    
    UIViewController *rootVC = nil;
        if ([curVersion isEqualToString:oldVersion]) {
            // 没有最新版本号，进入核心界面
            rootVC = [[SFTabBarController alloc] init];
        } else {
    // 有最新版本号，进入新特性界面，保存当前的版本号
//            rootVC = [[SFNewfeatureController alloc] init];
//            
//            [SFSaveTools setObject:curVersion forKey:SFVersionKey];
            rootVC = [[SFTabBarController alloc] init];

        }
    
    return rootVC;
    
}

@end
