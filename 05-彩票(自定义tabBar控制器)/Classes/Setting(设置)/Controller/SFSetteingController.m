//
//  SFSetteingController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFSetteingController.h"
#import "SFSettingArrowItem.h"
#import "SFSettingSwitchItem.h"
#import "SFSettingGroupItem.h"
#import "SFSettingCell.h"
#import "SFBlurView.h"
#import "MBProgressHUD+XMG.h"

@interface SFSetteingController () <UITableViewDataSource>

/**记录所有数组总数*/
@property (strong, nonatomic) NSMutableArray *groupArray;

@end

@implementation SFSetteingController

- (NSMutableArray *)groupArray {

    if (!_groupArray) {
        _groupArray = [NSMutableArray array];
    }
    return _groupArray;
}

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
   // 当前组有多少行
    NSArray *item = @[redeemCodem];
    SFSettingGroupItem *groupItem = [SFSettingGroupItem items:item];
    groupItem.headTitle = @"abce";
    
    [self.groupArray addObject:groupItem];
}

- (void)group1 {
    
    SFSettingArrowItem *redeemCodem = [SFSettingArrowItem itemImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    SFSettingSwitchItem *redeemCodem1 = [SFSettingSwitchItem itemImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    SFSettingSwitchItem *redeemCodem2 = [SFSettingSwitchItem itemImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    SFSettingSwitchItem *redeemCodem3 = [SFSettingSwitchItem itemImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    NSArray *item = @[redeemCodem, redeemCodem1, redeemCodem2, redeemCodem3];
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


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 取出时哪一组
    SFSettingGroupItem *groupItem = self.groupArray[section];
    return groupItem.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 快速创建cell
    SFSettingCell *cell = [SFSettingCell cellWithTableView:tableView style:UITableViewCellStyleValue1];
    
    // 取出哪一组
    SFSettingGroupItem *groupItem = self.groupArray[indexPath.section];
    // 取出哪一行
    SFSettingItem *item = groupItem.items[indexPath.row];
    
    cell.item = item;
    
    return cell;
    
}

// 返回头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // 取出哪一组
    SFSettingGroupItem *groupItem = self.groupArray[section];
    
    return groupItem.headTitle;
        
}

// 返回尾部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    // 取出哪一组
    SFSettingGroupItem *groupItem = self.groupArray[section];
    
    return groupItem.footTitle;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    SFSettingGroupItem *groupItem = self.groupArray[indexPath.section];
    SFSettingItem *item = groupItem.items[indexPath.row];
    if (item.cellOperationBlock) {
        item.cellOperationBlock();
    }
}
@end
