//
//  SFNewfeatureController.m
//  05-彩票(自定义tabBar控制器)
//
//  Created by ma c on 16/8/15.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFNewfeatureController.h"
#import "SFNewfeatureCell.h"


#define SFPages 4
// 展示图片的控件应该添加到collectionView上

@interface SFNewfeatureController ()

@property (assign, nonatomic) CGFloat lastOffsetX;

@property (strong, nonatomic) UIImageView *guideView;
@property (strong, nonatomic) UIImageView *guideLargetView;
@property (strong, nonatomic) UIImageView *guideSmallView;

@end

static NSString *ID = @"cell";
@implementation SFNewfeatureController
// UICollectionViewController 的层次结构：控制器view， 上面UICollectionView
// self.view = !self.collectionView

// 1.初始化的时候必须设置布局参数， 通常使用系统提供的流水布局
// 2.cell必须通过注册
// 3.自定义cell

- (instancetype)init {
    
    // 流水布局对象，设置cell的尺寸和位置
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 设置cell的尺寸
    layout.itemSize = SFScreenBounds.size;
//    // 设置cell之间的间距
    layout.minimumInteritemSpacing = 0;
    // 设置行距
    layout.minimumLineSpacing = 0;
    
//    // 设置每一组的内间距
//    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    
    return [super initWithCollectionViewLayout:layout];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return SFPages;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SFNewfeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground", indexPath.item + 1];
    cell.image = [UIImage imageNamed:imageName];
    
    // 告诉cell什么时候是最后一行
    [cell setupIndexPath:indexPath count:SFPages];
    
    return  cell;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor =[UIColor greenColor];
    
    // 弹簧效果
    self.collectionView.bounces = NO;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    self.collectionView.pagingEnabled = YES;
    
    // 注册cell
    [self.collectionView registerClass:[SFNewfeatureCell class] forCellWithReuseIdentifier:ID];
    
    [self setupAllChildView];
}

- (void)setupAllChildView {

    
    // guid1
    UIImageView *guide = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    self.guideView = guide;
    guide.centerX = self.view.centerX;
    
    [self.collectionView addSubview:guide];
    
    // guideLine
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    guideLine.x -= 200;
    
    [self.collectionView addSubview:guideLine];
    
    // largerText
    UIImageView *lagerText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    self.guideLargetView = lagerText;
    lagerText.centerX = self.view.centerX;
    lagerText.centerY = self.view.height * 0.7;
    
    [self.collectionView addSubview:lagerText];
    
    // smallText
    UIImageView *smallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    self.guideSmallView = smallText;
    smallText.centerX = self.view.centerX;
    smallText.centerY = self.view.height * 0.8;
    
    [self.collectionView addSubview:smallText];

}

// 减速完成
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 获取当前x的偏移量
    CGFloat curOffsetX = scrollView.contentOffset.x;
    
    // 获取差值
    CGFloat delta = curOffsetX - _lastOffsetX;
    
    // 往左边滑动， 图片从右往左动画
    _guideView.x += delta * 2;
    _guideSmallView.x += delta * 2;
    _guideLargetView.x += delta * 2;
    
    [UIView animateWithDuration:0.25 animations:^{
       
        _guideView.x -= delta;
        _guideSmallView.x -= delta;
        _guideLargetView.x -= delta;

    }];
    
    // 修改控件的内容
    int page = curOffsetX / self.view.width + 1;
    NSString *imageName = [NSString stringWithFormat:@"guide%d", page];
    self.guideView.image = [UIImage imageNamed:imageName];
    self.guideLargetView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%d", page]];
    self.guideSmallView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%d", page]];
    
    _lastOffsetX = curOffsetX;
}
@end
