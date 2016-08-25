//
//  SFNewfeatureCell.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/15.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFNewfeatureCell.h"
#import "SFTabBarController.h"

@interface SFNewfeatureCell ()

@property (strong, nonatomic) UIImageView *imageView;

@property (strong, nonatomic) UIButton * startBtn;

@end

@implementation SFNewfeatureCell

- (UIButton *)startBtn {
    if (!_startBtn) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [_startBtn sizeToFit];
        
        [_startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        
        _startBtn.center = CGPointMake(self.width * 0.5, self.height
                                       * 0.9);
        
        [self.contentView addSubview:_startBtn];
    }
    return _startBtn;
}


- (UIImageView *)imageView {

    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image {

    _image = image;
    self.imageView.image = image;
}


- (void)setupIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count {

    // 最后一行，添加立即体验按钮
    if (indexPath.row == count - 1) {
        
        self.startBtn.hidden = NO;
    } else {
        self.startBtn.hidden = YES;
    }
}

// 点击立即体验按钮
- (void)start {

    // 跳转到核心界面 push,modal切换跟控制器
    SFKeyWindow.rootViewController = [[SFTabBarController alloc] init];
    
    // 转场动画
    CATransition *transition = [CATransition animation];
    transition.type = @"rippleffect";
    transition.duration = 0.5;
    [SFKeyWindow.layer addAnimation:transition forKey:nil];
}

@end
