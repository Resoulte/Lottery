//
//  SFTabBar.h
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/7/23.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SFTabBar;

@protocol  SFTabBarDelegate <NSObject>

@optional
- (void)tabBar:(SFTabBar *)tabBar didiClickBtn:(NSInteger)index;

@end

@interface SFTabBar : UIView
/**
 *  存放SFTabbarItem模型数组
 */
@property (strong, nonatomic) NSArray *items;
// 代理
@property (weak, nonatomic) id<SFTabBarDelegate> delegate;
@end
