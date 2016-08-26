//
//  SFScoreViewController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFScoreViewController.h"

@interface SFScoreViewController ()

@end

@implementation SFScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self group0];
    [self group1];
    [self group1];
    [self group1];
    [self group1];
    [self group1];
    [self group1];
    [self group1];
}

- (void)group0 {

    SFSettingSwitchItem *push = [SFSettingSwitchItem itemImage:nil title:@"推送我关注的比赛"];
    SFSettingGroupItem *group = [SFSettingGroupItem items:@[push]];
    group.footTitle = @"开启后，当我投注或关注的比赛开始、进球和结束时，会自动发送推送消息提醒我";
    [self.groupArray addObject:group];
}

- (void)group1 {

    SFSettingItem *item = [SFSettingItem itemImage:nil title:@"起始时间"];
    item.subTitle = @"00:00";
    
    __weak typeof(self) weakSelf = self;
    
    // __block会把代码里所有强指针全部引用
    // 在ios7之后只要在cell上添加UITextField就自动做了键盘处理
    item.cellOperationBlock = ^(NSIndexPath * indexpath) {
        // 获取当前选中的cell
        UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexpath];
        // 弹出键盘
        UITextField *filed = [[UITextField alloc] init];
        [filed becomeFirstResponder];
        [cell addSubview:filed];
    };
    
    SFSettingGroupItem *group = [SFSettingGroupItem items:@[item]];
    group.headTitle = @"只在以下时间段接收比分直播推送";
    [self.groupArray addObject:group];
}

@end
