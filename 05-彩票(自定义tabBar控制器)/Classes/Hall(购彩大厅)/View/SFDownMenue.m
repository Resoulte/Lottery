//
//  SFDownMenue.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/7/26.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFDownMenue.h"
#import "SFMenueItem.h"
#import "UIView+SFFrame.h"

#define SFCols 3
#define SFItemWH SFScreenWidth / SFCols

@interface SFDownMenue ()

@property (strong, nonatomic) NSArray *items;
/**存放所有的btn*/
@property (strong, nonatomic) NSMutableArray *btns;

@end

@implementation SFDownMenue

- (NSMutableArray *)btns {

    if (!_btns) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

#pragma mark - 隐藏菜单
- (void)hide {
    [UIView animateWithDuration:0.5 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, -self.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

+ (instancetype)showInView:(UIView *)superView items:(NSArray *)items origionY:(CGFloat)origionY {
    
    NSInteger count = items.count;
    
    // 必须是3的倍数
    if (count % 3) {
        // 不是三的倍数, 抛出异常
        NSException *exc = [NSException exceptionWithName:@"items的总数不符合" reason:@"传入的数组总数必须是3的倍数" userInfo:nil];
        [exc raise];
        
    }
    
    SFDownMenue *menu = [[SFDownMenue alloc] init];
    // (count - 1) / cols + 1 行数
    NSInteger rows = (count - 1) / SFCols + 1;
    
    CGFloat menuH =  rows * SFItemWH;
    
    menu.frame = CGRectMake(0, origionY, SFScreenWidth, menuH);
    
    menu.items = items;

    // 添加按钮
    [menu setupAllButtons];
    
    // 添加分隔线
    [menu setupAllDevideView];
    
    // 添加黑色的view
    UIView *blackView = [[UIView alloc] initWithFrame:menu.frame];
    blackView.backgroundColor = [UIColor blackColor];
    [superView addSubview:blackView];
    
    // 往下移动的动画
    menu.transform = CGAffineTransformMakeTranslation(0, -menu.height);
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        menu.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [blackView removeFromSuperview];
    }];
    
    menu.backgroundColor = [UIColor blackColor];
    [superView addSubview:menu];
    
    return menu;
}

#pragma mark - 添加所有按钮
- (void)setupAllButtons {

    for (SFMenueItem *item in self.items) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:item.title forState:UIControlStateNormal];
        [btn setImage:item.image forState:UIControlStateNormal];
        
        [self addSubview:btn];
        [self.btns addObject:btn];
    }
}

#pragma mark - 添加分隔线
- (void)setupAllDevideView {
    
    // col  总列数-1
    for (int i = 0; i < SFCols - 1; i ++) {
        UIView *divideV = [[UIView alloc] init];
        divideV.backgroundColor = [UIColor whiteColor];
        divideV.frame = CGRectMake((i + 1) * SFItemWH, 0, 1, self.height);
        
        [self addSubview:divideV];
    }
    
    NSInteger rows = (self.items.count - 1) / SFCols + 1;
    // row 总行数-1
    for (int i = 0; i < rows - 1; i ++) {
        UIView *divideV = [[UIView alloc] init];
        divideV.backgroundColor = [UIColor whiteColor];
        divideV.frame = CGRectMake(0, (i + 1) * SFItemWH, self.width, 1);
        
        [self addSubview:divideV];
    }
    
    
}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    int col = 0;
    NSUInteger row = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    
    // 布局所有的按钮
    NSUInteger count = self.items.count;
    for (NSUInteger i = 0; i < count; i ++) {
        col = i % SFCols;
        row = i / SFCols;
        x = col * SFItemWH;
        y = row * SFItemWH;
        UIButton *btn = self.btns[i];
        btn.frame = CGRectMake(x, y, SFItemWH, SFItemWH);
    }
}
@end
