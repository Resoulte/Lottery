//
//  SFArenaViewController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/7/23.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFArenaViewController.h"

@interface SFArenaViewController ()

@end

@implementation SFArenaViewController

// 重写，自定义控制器view
- (void)loadView {

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:SFScreenBounds];
    imageView.image = [UIImage imageNamed:@"NLArenaBackground"];
    imageView.userInteractionEnabled = YES;
#warning 还可以这样哦
    self.view = imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"足球", @"篮球"]];
    segment.width += 40;
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    segment.selectedSegmentIndex = 0;
    // 设置边框颜色
    segment.tintColor = SFColor(0, 142, 143);
    
    // 设置文字颜色
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [segment setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    self.navigationItem.titleView = segment;
    
    
    
}
@end
