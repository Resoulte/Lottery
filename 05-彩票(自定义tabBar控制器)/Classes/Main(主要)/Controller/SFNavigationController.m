//
//  SFNavigationController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/7/24.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFNavigationController.h"

@interface SFNavigationController () <UINavigationControllerDelegate>

@property (strong, nonatomic) id popDelegate;

@end

@implementation SFNavigationController

// 加载所有的类
// 程序一启动的时候就会调用
+ (void)load {

}

// 当前类或者其他的子类第一次使用的时候调用
+ (void)initialize {
    
    
    // 获取当前应用下所有的导航条
//    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:<#(nullable Class<UIAppearanceContainer>), ...#>, nil
//    :self, nil];
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"]forBarMetrics:UIBarMetricsDefault];
    
    // 通过TintColor设置导航条文字的颜色
//    [bar setTintColor:[UIColor whiteColor]];
    // 把文字取消 , 可以改变跳转按钮文字的偏移量
//    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -100) forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [bar setTitleTextAttributes:dict];
    
    // 获取UIButtonItem 设置返回按钮一般不用，用leftButtonItem
//    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBack"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 滑动交互的手势。还原滑动返回功能
//    self.interactivePopGestureRecognizer.delegate = nil;
    
    // 代理做了一个滑动返回功能，而且做了一系列的判断
    self.popDelegate = self.interactivePopGestureRecognizer.delegate;
    
    self.delegate = self;
}

#pragma mark - UINavigationControllerDelegate
// 完全展示完调用
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {

    if (viewController == [self.viewControllers firstObject]) {
        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
    }
    //  如果展示的是根控制器，就还原pop手势的代理
//    NSLog(@"%@", viewController);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 重写push方法
// self -> 导航控制器
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
//    SFLog(@"%@ld", self.viewControllers.count);
    
    if (self.viewControllers.count != 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 设置导航条左边按钮的内容  方法1. 会把系统的返回按钮给覆盖，导航控制器的滑动返回功能就木有啦
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOrigionRenderImage:@"NavBack"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
        
        self.interactivePopGestureRecognizer.delegate = nil;
        
    }
    
    // 必须在if后面
   [super pushViewController:viewController animated:animated];
}

//- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
//
//    UIViewController *vc = [super popViewControllerAnimated:animated];
//    if (self.viewControllers.count == 1) {
//        // 根控制器
//        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
//    }
//    return vc;
//}

- (void)back {

    [self popViewControllerAnimated:YES];
}

@end
