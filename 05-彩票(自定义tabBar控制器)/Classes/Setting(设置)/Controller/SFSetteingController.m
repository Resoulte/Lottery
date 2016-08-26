//
//  SFSetteingController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFSetteingController.h"
#import "SFSettingArrowItem.h"
#import "SFSettingGroupItem.h"
#import "SFSettingSwitchItem.h"
#import "SFBlurView.h"
#import "MBProgressHUD+XMG.h"
#import "SFPushViewController.h"

@interface SFSetteingController () <UITableViewDataSource, UITableViewDelegate>


@end

@implementation SFSetteingController


- (instancetype)init {

    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    [self group0];
    [self group1];
    [self group2];
    
}

- (void)group0 {

    SFSettingArrowItem *redeemCodem = [SFSettingArrowItem itemImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    redeemCodem.destVC = [UIViewController class];
    
   // 当前组有多少行
    NSArray *item = @[redeemCodem];
    SFSettingGroupItem *groupItem = [SFSettingGroupItem items:item];
    groupItem.headTitle = @"abce";
    
    [self.groupArray addObject:groupItem];
}

- (void)group1 {
    
    SFSettingArrowItem *push = [SFSettingArrowItem itemImage:[UIImage imageNamed:@"MorePush"] title:@"推送和提醒"];
    push.destVC = [SFPushViewController class];
    
    SFSettingSwitchItem *redeemCodem1 = [SFSettingSwitchItem itemImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    SFSettingSwitchItem *redeemCodem2 = [SFSettingSwitchItem itemImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    SFSettingSwitchItem *redeemCodem3 = [SFSettingSwitchItem itemImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    NSArray *item = @[push, redeemCodem1, redeemCodem2, redeemCodem3];
    SFSettingGroupItem *groupItem = [SFSettingGroupItem items:item];
    
    [self.groupArray addObject:groupItem];
}

- (void)group2 {
    
    SFSettingArrowItem *version = [SFSettingArrowItem itemImage:[UIImage imageNamed:@"RedeemCode"] title:@"检查新版本"];
    
    version.cellOperationBlock = ^(){
        // 高斯模糊效果
        SFBlurView *blur = [[SFBlurView alloc] initWithFrame:SFScreenBounds];
        [SFKeyWindow addSubview:blur];
        [MBProgressHUD showSuccess:@"当前没有最新版本"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [blur removeFromSuperview];
        });
    };
    
    SFSettingArrowItem *redeemCodem1 = [SFSettingArrowItem itemImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    SFSettingArrowItem *redeemCodem2 = [SFSettingArrowItem itemImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    SFSettingArrowItem *redeemCodem3 = [SFSettingArrowItem itemImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    // 当前组有多少行
    NSArray *item = @[version, redeemCodem1, redeemCodem2, redeemCodem3];
    SFSettingGroupItem *groupItem = [SFSettingGroupItem items:item];
    
    [self.groupArray addObject:groupItem];
}


@end
