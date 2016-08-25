//
//  SFNewfeatureCell.h
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/15.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFNewfeatureCell : UICollectionViewCell

@property (strong, nonatomic) UIImage *image;

- (void)setupIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count;

@end
