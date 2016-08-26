//
//  SFSettingCell.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/25.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFSettingCell.h"
#import "SFSettingSwitchItem.h"
#import "SFSettingArrowItem.h"

@interface SFSettingCell ()

/**箭头*/
@property (strong, nonatomic) UIImageView *arrowImage;
/**开关*/
@property (strong, nonatomic) UISwitch *AccessorySwitch;

@end


@implementation SFSettingCell

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style {
    
    static NSString *ID = @"cell";
    SFSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SFSettingCell alloc] initWithStyle:style reuseIdentifier:ID];
    }
    
    return cell;
    
}

- (void)setItem:(SFSettingItem *)item {
    _item = item;
    
    // 设置数据
    [self data];
    // 设置辅助视图
    [self setupAccessoryView];
}

- (void)data {
    
    self.imageView.image = _item.iconImage;
    self.textLabel.text = _item.title;
    self.detailTextLabel.text = _item.subTitle;
}

// 辅助视图
//    cell.accessoryView
- (void)setupAccessoryView {
    
    if ([_item isKindOfClass:[SFSettingArrowItem class]]) {
        // 设置箭头
        self.accessoryView = self.arrowImage;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    } else if ([_item isKindOfClass:[SFSettingSwitchItem class]]) {
        // 设置开关
        self.accessoryView = self.AccessorySwitch;
        // switch 不需要被选中 , 设置之后其他的需要还原为默认
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    } else {
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    
}

#pragma mark - setter and getter 
- (UIImageView *)arrowImage {

    if (!_arrowImage) {
        _arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right" ]];
    }
    return _arrowImage;
}

- (UISwitch *)AccessorySwitch {

    if (!_AccessorySwitch) {
        _AccessorySwitch = [[UISwitch alloc] init];
    }
    return _AccessorySwitch;
}
@end
