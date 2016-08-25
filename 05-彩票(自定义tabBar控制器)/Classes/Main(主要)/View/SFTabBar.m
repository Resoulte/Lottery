//
//  SFTabBar.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/7/23.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFTabBar.h"
#import "SFBarButton.h"

@interface SFTabBar ()

@property (weak, nonatomic) SFBarButton *selectButton;
@end

@implementation SFTabBar

- (void)setItems:(NSArray *)items {

    _items = items;
    for (UITabBarItem *item in items) {
        SFBarButton *btn = [SFBarButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        btn.tag = self.subviews.count;
        [self addSubview:btn];
        
        if (self.subviews.count == 1) {
            // 默认选中第一个
            [self btnClick:btn];
            
            
            
        }
        
    }
}


- (void)layoutSubviews {

    [super layoutSubviews];

    
    int count = (int)self.subviews.count;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = [UIScreen mainScreen].bounds.size.width / count;
    CGFloat height = self.bounds.size.height;
    for (int i = 0; i < count; i ++) {
        SFBarButton *btn = self.subviews[i];
        x = i * width;
        btn.frame = CGRectMake(x, y, width, height);
    }
}

- (void)btnClick:(SFBarButton *)button {
    
    self.selectButton.selected = NO;
    button.selected = YES;
    self.selectButton = button;
//    button.selected = !self.selectButton.selected
    
    if ([_delegate respondsToSelector:@selector(tabBar:didiClickBtn:)]) {
        [_delegate tabBar:self didiClickBtn:button.tag];
    }
}

@end
