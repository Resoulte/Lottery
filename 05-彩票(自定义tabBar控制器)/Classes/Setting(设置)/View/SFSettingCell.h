//
//  SFSettingCell.h
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFSettingItem.h"

@interface SFSettingCell : UITableViewCell

/**setting模型*/
@property (strong, nonatomic) SFSettingItem *item;

/**快速创建cell*/
+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style ;
@end
