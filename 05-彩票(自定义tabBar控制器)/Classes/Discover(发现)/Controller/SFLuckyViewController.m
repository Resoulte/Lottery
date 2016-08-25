//
//  SFLuckyViewController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/13.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFLuckyViewController.h"

@interface SFLuckyViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *lightView;

@end 

@implementation SFLuckyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image1 = [UIImage imageNamed:@"lucky_entry_light0"];
    UIImage *image2 = [UIImage imageNamed:@"lucky_entry_light1"];
    self.lightView.animationImages = @[image1, image2];
    
    self.lightView.animationDuration = 1;
    [self.lightView startAnimating];
}


@end
