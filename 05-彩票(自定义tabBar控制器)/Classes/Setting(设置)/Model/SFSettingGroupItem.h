//
//  SFSettingGroupItem.h
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFSettingGroupItem : NSObject

/**这一组有多少行*/
@property (strong, nonatomic) NSArray *items;
/**头部标题*/
@property (copy, nonatomic) NSString * headTitle;
/**尾部标题*/
@property (copy, nonatomic) NSString * footTitle;

+ (instancetype)items:(NSArray *)items; //HeadTitle:(NSString *)headTitle footTitle:(NSString)footTitle;

@end
