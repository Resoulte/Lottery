//
//  SFSettingItem.h
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFSettingItem : NSObject

/**图片*/
@property (strong, nonatomic) UIImage *iconImage;
/**标题*/
@property (copy, nonatomic) NSString *title;
/**子标题*/
@property (copy, nonatomic) NSString *subTitle;

+ (instancetype)itemImage:(UIImage *)image title:(NSString *)title;

@end
