//
//  SFSettingHelpController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFSettingHelpController.h"
#import "SFHelpItem.h"

@interface SFSettingHelpController ()

/**模型数组*/
@property (strong, nonatomic) NSMutableArray *itemArray;

@end

@implementation SFSettingHelpController


- (NSMutableArray *)itemArray {

    if (!_itemArray) {
        _itemArray = [NSMutableArray array];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        for (NSDictionary *dict in dataArray) {
            [_itemArray addObject:[SFHelpItem itemWithDict:dict]];
        }
//        SFLog(@"%@", _itemArray);
    }
    return _itemArray;
}



@end
