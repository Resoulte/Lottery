//
//  SFActiveMenue.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/7/24.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFActiveMenue.h"
#import "SFCover.h"

@implementation SFActiveMenue

+ (instancetype)activeMenue {

    return [[NSBundle mainBundle] loadNibNamed:@"SFActiveMenue" owner:nil options:nil][0];
}

#pragma mark - 显示菜单
+ (instancetype)showinPoint:(CGPoint)point {

    SFActiveMenue *menue = [SFActiveMenue activeMenue];
    menue.center = point;
    [SFKeyWindow addSubview:menue];
    
    return menue;
}

- (IBAction)close:(id)sender {
    
    if ([_delegate respondsToSelector:@selector(activeMenueDidBtnClickCloseMenue:)]) {
        
        [_delegate activeMenueDidBtnClickCloseMenue:self];
    }
    
    
}

#pragma mark - 隐藏菜单
+ (void)hideinPoint:(CGPoint)point completion:(void (^)())completion{

    for (SFActiveMenue *childView in SFKeyWindow.subviews) {
        if ([childView isKindOfClass:self]) {
            
            [childView setupAnimation:point completion:^{
                completion();
            }];
        }
    }
}
#pragma mark - 隐藏菜单动画
- (void)setupAnimation:(CGPoint)point completion:(void(^)())completion{

    [UIView animateWithDuration:0.25 animations:^{
        self.transform = CGAffineTransformTranslate(self.transform, -self.center.x + 44, -self.center.y + 44);
        self.transform = CGAffineTransformScale(self.transform, 0.01, 0.01);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if (completion) {
            completion();
        }
        
//        [SFCover hide];
    }];
}
//- (void)activeMenueDidBtnClickCloseMenue:(SFActiveMenue *)menue {
//
//    self.transform = CGAffineTransformMakeScale(0, 0);
//}
@end
