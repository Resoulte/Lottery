//
//  SFSettingBaseController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 shifei. All rights reserved.


#import "SFSettingBaseController.h"
#import "SFSettingSwitchItem.h"
#import "SFSettingGroupItem.h"
#import "SFSettingArrowItem.h"
#import "SFSettingCell.h"


@interface SFSettingBaseController () <UITableViewDelegate, UITableViewDataSource>


@end

@implementation SFSettingBaseController

- (NSMutableArray *)groupArray {
    
    if (!_groupArray) {
        _groupArray = [NSMutableArray array];
    }
    return _groupArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    // 自动取消选中的效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SFSettingGroupItem *groupItem = self.groupArray[indexPath.section];
    SFSettingItem *item = groupItem.items[indexPath.row];
    if (item.cellOperationBlock) {
        item.cellOperationBlock();
    }
    
    if ([item isKindOfClass:[SFSettingArrowItem class]]) {
        SFSettingArrowItem *arrowItem = (SFSettingArrowItem *)item;
        if (arrowItem.destVC) {
            // 才需要跳转
            // 创建跳转控制器
            UIViewController *vc = [[arrowItem.destVC alloc] init];
            vc.title = item.title;
//            vc.view.backgroundColor = [UIColor redColor];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
        
    }
}

@end
