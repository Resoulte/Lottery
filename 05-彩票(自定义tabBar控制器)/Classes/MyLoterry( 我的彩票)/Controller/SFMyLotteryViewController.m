//
//  SFMyLotteryViewController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/7/23.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFMyLotteryViewController.h"
#import "UIImage+SFImage.h"
#import "SFSetteingController.h"

@interface SFMyLotteryViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation SFMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取按钮背景图片
    UIImage *image = self.loginButton.currentBackgroundImage;
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    // 按钮的图片只能通过代码去拉伸
    [self.loginButton setBackgroundImage:image forState:UIControlStateNormal];

    
//    // 获取按钮背景图片
//    UIImage *image = _loginButton.currentBackgroundImage;
//    
//    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
//    
//    // 注意按钮的图片只能通过代码去拉伸
//    [_loginButton setBackgroundImage:image forState:UIControlStateNormal];
    
    
    // 设置导航条上的内容
    [self setupNav];
}

- (void)setupNav {

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
//    [btn setTitle:@"客服" forState:UIControlStateNormal];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    NSAttributedString *attribute = [[NSAttributedString alloc] initWithString:@"客服" attributes:dict];
    [btn setAttributedTitle:attribute forState:UIControlStateNormal];
    // 自适应
    [btn sizeToFit];
    // 左边
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    // 右边
    

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOrigionRenderImage:@"Mylottery_config"] style:UIBarButtonItemStylePlain target:self action:@selector(setting)];
    self.navigationItem.rightBarButtonItem = rightItem;

}

#pragma mark - 跳转到我的设置界面
- (void)setting {

//    NSLog(@"设置");
    // 跳转到我的设置界面
    SFSetteingController *vc = [[SFSetteingController alloc] init];
//    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
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
