//
//  SFActiveMenue.h
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/7/24.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SFActiveMenue;
@protocol SFActiveMenueDelegate <NSObject>

@optional
- (void)activeMenueDidBtnClickCloseMenue:(SFActiveMenue *)menue;

@end

@interface SFActiveMenue : UIView
// 如果一个控制器从xib加载，控件的尺寸默认跟xib一样大
+ (instancetype)activeMenue;

+ (instancetype)showinPoint:(CGPoint)point;

+ (void)hideinPoint:(CGPoint)point completion:(void(^)())completion;

@property (weak, nonatomic) id<SFActiveMenueDelegate> delegate;
@end
