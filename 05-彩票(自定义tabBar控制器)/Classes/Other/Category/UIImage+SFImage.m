//
//  UIImage+SFImage.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/7/24.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "UIImage+SFImage.h"

@implementation UIImage (SFImage)

+ (instancetype)imageWithOrigionRenderImage:(NSString *)imageNames {

    UIImage *image = [UIImage imageNamed:imageNames];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (instancetype)imageWithStretchableImageName:(NSString *)imageName {
    
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
}
@end
