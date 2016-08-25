//
//  UIImage+SFImage.h
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/7/24.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SFImage)
/**渲染图片工具类*/
+ (instancetype)imageWithOrigionRenderImage:(NSString *)imageNames;
/**拉伸图片工具类*/
+ (instancetype)imageWithStretchableImageName:(NSString *)imageName;
@end
