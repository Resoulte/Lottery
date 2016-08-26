//
//  SFPushViewController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFPushViewController.h"
#import "SFScoreViewController.h"
#import "SFAwardViewController.h"

@interface SFPushViewController ()


@end

@implementation SFPushViewController

- (instancetype)init {
    
    return [super initWithStyle:UITableViewStyleGrouped];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self group0];
}

- (void)group0 {

    SFSettingArrowItem *push = [SFSettingArrowItem itemImage:nil title:@"开奖推送"];
    push.destVC = [SFAwardViewController class];
    
    SFSettingArrowItem *score = [SFSettingArrowItem itemImage:nil title:@"比分直播"];
    score.destVC = [SFScoreViewController class];
    
    SFSettingArrowItem *redeemCodem2 = [SFSettingArrowItem itemImage:nil title:@"使用兑换码"];
    SFSettingArrowItem *redeemCodem3 = [SFSettingArrowItem itemImage:nil title:@"使用兑换码"];
    NSArray *item = @[push, score, redeemCodem2, redeemCodem3];
    SFSettingGroupItem *groupItem = [SFSettingGroupItem items:item];
    
    [self.groupArray addObject:groupItem];
}



@end
