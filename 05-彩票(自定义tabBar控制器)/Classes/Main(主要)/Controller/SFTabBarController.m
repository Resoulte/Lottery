//
//  SFTabBarController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/7/23.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFTabBarController.h"
#import "SFArenaViewController.h"
#import "SFDiscoverViewController.h"
#import "SFHallViewController.h"
#import "SFHistoryViewController.h"
#import "SFMyLotteryViewController.h"
#import "SFNavigationController.h"

#import "SFTabBar.h"

#import "SFArenaNavController.h"

@interface SFTabBarController () <SFTabBarDelegate>
@property (strong, nonatomic) NSMutableArray *items;
@end

@implementation SFTabBarController

- (NSMutableArray *)items {

    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建控制器
    [self setupAllViewController];
    
    // 设置SFTabBar
    [self setupSFTabBar];
}

#pragma mark - 设置SFTabBar
- (void)setupSFTabBar {
    
    
    SFTabBar *tabBar = [[SFTabBar alloc] init];
    tabBar.items = self.items;
    tabBar.frame = self.tabBar.bounds;
    tabBar.backgroundColor = [UIColor orangeColor];
    [self.tabBar addSubview:tabBar];
    tabBar.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    // 把系统的tabBar上的按钮干掉
    for (UIView *children in self.tabBar.subviews) {
        if (![children isKindOfClass:[SFTabBar class]]) {
            [children removeFromSuperview];
        }
    }
}

#pragma mark - SFTabBarDelegate
- (void)tabBar:(SFTabBar *)tabBar didiClickBtn:(NSInteger)index {

    self.selectedIndex = index;
}

#pragma mark - 创建控制器
- (void)setupAllViewController {
    
    // 购彩大厅
    SFHallViewController *hall = [[SFHallViewController alloc] init];
    [self setupOneViewController:hall image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] selectedImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] title:@"购彩大厅"];
    
    // 竞技场
    SFArenaViewController *arena = [[SFArenaViewController alloc] init];
    [self setupOneViewController:arena image:[UIImage imageNamed:@"TabBar_Arena_new"] selectedImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] title:nil];
    
    // 发现
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SFDiscoverViewController" bundle:nil];
    SFDiscoverViewController *discover = [storyboard instantiateInitialViewController];
    [self setupOneViewController:discover image:[UIImage imageNamed:@"TabBar_Discovery_new"] selectedImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] title:@"发现"];
    
    // 开奖信息
    SFHistoryViewController *history = [[SFHistoryViewController alloc] init];
    [self setupOneViewController:history image:[UIImage imageNamed:@"TabBar_History_new"] selectedImage:[UIImage imageNamed:@"TabBar_History_selected_new"] title:@"开奖信息"];
    
    // 我的彩票
    SFMyLotteryViewController *myLottery = [[SFMyLotteryViewController alloc] init];
    [self setupOneViewController:myLottery image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selectedImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] title:@"我的彩票"];
    
    
    
}

#pragma mark - 添加一个控制器
- (void)setupOneViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title {
    
    // 描述对应按钮的内容
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    vc.navigationItem.title = title;
//    vc.view.backgroundColor = [UIColor whiteColor];
    
    [self.items addObject:vc.tabBarItem];
    
    // 把控制器包装成导航按钮
    UINavigationController *nav = [[SFNavigationController alloc] initWithRootViewController:vc];
    if ([vc isKindOfClass:[SFArenaViewController class]]) {
        nav = [[SFArenaNavController alloc] initWithRootViewController:vc];
    }
    
    [self addChildViewController:nav];
    
}

- (UIColor *)randomColor {

    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}
@end
