//
//  SFAwardViewController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFAwardViewController.h"

@interface SFAwardViewController ()

@end

@implementation SFAwardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addGroup0];
}

- (void)addGroup0
{
    
    SFSettingSwitchItem *item = [SFSettingSwitchItem itemImage:nil  title:@"双色球"];
    item.subTitle = @"每周二、四、日开奖";
    SFSettingSwitchItem *item1 = [SFSettingSwitchItem itemImage:nil title:@"大乐透"];
    item1.subTitle = @"每周一、三、六开奖";
    SFSettingSwitchItem *item2 = [SFSettingSwitchItem itemImage:nil title:@"3D"];
    item2.subTitle = @"每天开奖、包括试机号提醒";
    SFSettingSwitchItem *item3 = [SFSettingSwitchItem itemImage:nil title:@"七乐彩"];
    item3.subTitle = @"每周一、三、五开奖";
    SFSettingSwitchItem *item4 = [SFSettingSwitchItem itemImage:nil title:@"七星彩"];
    item4.subTitle = @"每周二、五、日开奖";
    SFSettingSwitchItem *item5 = [SFSettingSwitchItem itemImage:nil title:@"排列3"];
    item5.subTitle = @"每天开奖";
    SFSettingSwitchItem *item6 = [SFSettingSwitchItem itemImage:nil title:@"排列5"];
    item6.subTitle = @"每天开奖";
    
    SFSettingGroupItem *group = [[SFSettingGroupItem alloc] init];
    group.items = @[item,item1,item2,item3,item4,item5,item6];
    
    
    [self.groupArray addObject:group];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建cell
    SFSettingCell *cell = [SFSettingCell cellWithTableView:tableView style:UITableViewCellStyleSubtitle];
    
    // 取出哪一组
    SFSettingGroupItem *group = self.groupArray[indexPath.section];
    
    // 取出哪一行
    SFSettingItem *item = group.items[indexPath.row];
    
    // 给cell传递模型
    cell.item = item;
    
    return cell;
    
}

@end
