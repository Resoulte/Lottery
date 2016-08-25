//
//  SFHallViewController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/7/23.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFHallViewController.h"
#import "SFCover.h"
#import "SFActiveMenue.h"
#import "SFDownMenue.h"
#import "SFMenueItem.h"



@interface SFHallViewController () <SFActiveMenueDelegate>

// 用strong不会释放掉
@property (weak, nonatomic)  SFDownMenue *downMenue;
@property (assign, nonatomic) BOOL isPopMenue;
@end

@implementation SFHallViewController

- (SFDownMenue *)downMenue {

    if (!_downMenue) {
        SFMenueItem *item = [SFMenueItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        SFMenueItem *item1 = [SFMenueItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        SFMenueItem *item2 = [SFMenueItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        SFMenueItem *item3 = [SFMenueItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        SFMenueItem *item4 = [SFMenueItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        SFMenueItem *item5 = [SFMenueItem itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        NSArray *items = @[item, item1, item2, item3, item4, item5];
        
        // 弹出黑色菜单
        _downMenue = [SFDownMenue showInView:self.view items:items origionY:0];
    }
    return _downMenue;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航条内容
    [self setupNav];
}

- (void)setupNav {
    
    // 左边
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOrigionRenderImage:@"CS50_activity_image"] style:UIBarButtonItemStylePlain target:self action:@selector(active)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    // 右边
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOrigionRenderImage:@"Development"] style:UIBarButtonItemStylePlain target:self action:@selector(popMenue)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)active {
    // 弹出蒙版
    [SFCover show];
    
//    NSLog(@"%02d", arc4random_uniform(9) + 1);
    
    // 弹出活动菜单
    SFActiveMenue *menue = [SFActiveMenue showinPoint:self.view.center];
    menue.delegate = self;
    
    
    
}

#pragma mark - SFActiveMenueDelegate
- (void)activeMenueDidBtnClickCloseMenue:(SFActiveMenue *)menue {

    [SFActiveMenue hideinPoint:CGPointMake(44, 44) completion:^{
        [SFCover hide];
    }];
}

#pragma mark - 弹出菜单
- (void)popMenue {

    if (_isPopMenue == NO) {
        [self downMenue];
    } else {
    // 隐藏菜单
        [self.downMenue hide];
    }
    _isPopMenue  =!_isPopMenue;
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/


@end
