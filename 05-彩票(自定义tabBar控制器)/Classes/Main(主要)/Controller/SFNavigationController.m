//
//  SFNavigationController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/7/24.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFNavigationController.h"
#import <objc/runtime.h>

@interface SFNavigationController () <UIGestureRecognizerDelegate>

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
    
    // 防止与系统的手势冲突
    self.interactivePopGestureRecognizer.enabled = NO;
    
    // 取出系统手势的target对象
    // 取出某对象里面的属性，1.KVC 前提条件：必须知道属性名 2.运行时
    
    // 遍历某个类里面的属性 Ivar:表示成员属性
    // copyIvarList 只能获取那个类下面的成员属性，并不会越界，（不会吧他的父类的属性遍历出来）
    // Class 获取那个类的成员属性
    // count 告诉你当前类里面成员属性的总数
//    unsigned int count = 0;
//    Ivar *ivars = class_copyIvarList([UIGestureRecognizer class], &count);
//    
//    for (int i = 0; i < count; i ++) {
//        // 取出成员变量
//        Ivar ivar = ivars[i];
//        
//        // 获取属性名
//        NSString *ivarName = @(ivar_getName(ivar));
//        
//        SFLog(@"%@", ivarName);
//    }
    // _targets:属性名value
    id targets = [self.interactivePopGestureRecognizer valueForKey:@"_targets"];
    
    id objc = [targets firstObject];
    id target = [objc valueForKey:@"_target"];
    SFLog(@"%@", target);
    
//    SFLog(@"%@", self.interactivePopGestureRecognizer.delegate); // = target
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    pan.delegate = self;
    
    [self.view addGestureRecognizer:pan];
    
    // 系统也有滑动手势，系统也是使用target实现了滑动功能（action）
//    self.interactivePopGestureRecognizer 滑动手势
   
    
//    UIScreenEdgePanGestureRecognizer *ges = self.interactivePopGestureRecognizer;
//    SFLog(@"%ld", ges.edges); // 2
}

#pragma mark - 手势代理方法
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {

    // 判断当前控制器是否为跟控制器
    return self.topViewController != [self.viewControllers firstObject];
}

/*
 SFLog(@"%@", self.interactivePopGestureRecognizer);
 <UIScreenEdgePanGestureRecognizer: 0x7fe419c73470; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7fe41c00d0f0>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7fe419c72fd0>)>>
 系统滑动手势类型：UIScreenEdgePanGestureRecognizer
 target：_UINavigationInteractiveTransition
 action: handleNavigationTransition
 */


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
