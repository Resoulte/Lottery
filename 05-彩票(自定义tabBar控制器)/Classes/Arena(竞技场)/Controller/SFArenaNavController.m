//
//  SFNacigationController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/13.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFArenaNavController.h"



@interface SFArenaNavController ()

@end

@implementation SFArenaNavController


+ (void)initialize {

    // 获取当前类下面所有的导航条去设置
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    [bar setBackgroundImage:[UIImage imageWithStretchableImageName:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
