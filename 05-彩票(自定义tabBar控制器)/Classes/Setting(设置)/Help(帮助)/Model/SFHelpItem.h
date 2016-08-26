//
//  SFHelpItem.h
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFHelpItem : NSObject

/**标题*/
@property (copy, nonatomic) NSString *title;
/**html*/
@property (copy, nonatomic) NSString *html;
/**id*/
@property (copy, nonatomic) NSString *ID;

// 快速进行字典转模型

+ (instancetype)itemWithDict:(NSDictionary *)dic; 
@end
