//
//  SFSettingHelpController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/26.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFSettingHelpController.h"
#import "SFHelpItem.h"
#import "SFSettingHtmlController.h"
#import "SFNavigationController.h"

@interface SFSettingHelpController ()

/**模型数组*/
@property (strong, nonatomic) NSMutableArray *itemArray;

@end

@implementation SFSettingHelpController

- (instancetype)init {

    return [super initWithStyle:UITableViewStyleGrouped];
}

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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    SFHelpItem *item = self.itemArray[indexPath.row];
    cell.textLabel.text = item.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SFHelpItem *item = self.itemArray[indexPath.row];
    
    SFSettingHtmlController *html = [[SFSettingHtmlController alloc] init];
    html.title = item.title;
    html.htmlItem = item;
    SFNavigationController *nav = [[SFNavigationController alloc] initWithRootViewController:html];
    
    [self presentViewController:nav animated:YES completion:nil];
    
}

@end
