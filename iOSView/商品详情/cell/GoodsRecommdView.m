//
//  GoodsRecommdView.m
//  ocCrazy
//
//  Created by LD on 2017/6/26.
//  Copyright © 2017年 LCLWZ. All rights reserved.
//

#import "GoodsRecommdView.h"

@implementation GoodsRecommdView

- (instancetype)initWithFrame:(CGRect)frame arr:(NSMutableArray *)data
{
    self  = [super initWithFrame: frame];
    if (self) {
        self.dataArr  = data;
        [self  initCollectView];
    }
    return self;
    
}

- (void)initCollectView
{
    if (_flowLayout == nil) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    }
    
    _flowLayout.itemSize = CGSizeMake(HEIGHT(95), HEIGHT(129));
    _flowLayout.minimumLineSpacing = HEIGHT(2);
    _flowLayout.minimumInteritemSpacing   = HEIGHT(2);
    _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    if (_collectView == nil) {
        _collectView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HEIGHT(132)) collectionViewLayout:_flowLayout];
    }
    
    _collectView.backgroundColor = [UIColor whiteColor];
    _collectView.showsHorizontalScrollIndicator = NO;
    // 指定代理人
    _collectView.delegate = self;
    _collectView.dataSource = self;
    [self addSubview:_collectView];
    UINib *nib  = [UINib nibWithNibName:@"RecommdCell" bundle:nil];
    [_collectView registerNib:nib forCellWithReuseIdentifier:@"recommdReuse"];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section

{
    
    return self.dataArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    
    RecommdCell *   cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recommdReuse" forIndexPath:indexPath];
   
    return cell;
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(HEIGHT(5), HEIGHT(9), HEIGHT(0), HEIGHT(9));
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
       
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return  HEIGHT(9);
}

@end
