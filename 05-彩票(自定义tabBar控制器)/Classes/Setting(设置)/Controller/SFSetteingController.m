//
//  SFSetteingController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFSetteingController.h"
#import "SFSettingItem.h"
#import "SFSettingGroupItem.h"

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

    SFSettingItem *redeemCodem = [SFSettingItem itemImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
   // 当前组有多少行
    NSArray *item = @[redeemCodem];
    SFSettingGroupItem *groupItem = [SFSettingGroupItem items:item];
    groupItem.headTitle = @"abce";
    
    [self.groupArray addObject:groupItem];
}

- (void)group1 {
    
    SFSettingItem *redeemCodem = [SFSettingItem itemImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    NSArray *item = @[redeemCodem];
    SFSettingGroupItem *groupItem = [SFSettingGroupItem items:item];
    
    [self.groupArray addObject:groupItem];
}

- (void)group2 {
    
    SFSettingItem *redeemCodem = [SFSettingItem itemImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    // 当前组有多少行
    NSArray *item = @[redeemCodem];
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
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    // 取出哪一组
    SFSettingGroupItem *groupItem = self.groupArray[indexPath.section];
    
    // 取出哪一行
    SFSettingItem *item = groupItem.items[indexPath.row];
    cell.imageView.image = item.iconImage;
    cell.textLabel.text = item.title;
    
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


@end
