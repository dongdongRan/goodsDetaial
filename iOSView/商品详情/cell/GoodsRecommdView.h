//
//  GoodsRecommdView.h
//  ocCrazy
//
//  Created by LD on 2017/6/26.
//  Copyright © 2017年 LCLWZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommdCell.h"
@interface GoodsRecommdView : UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

- (instancetype)initWithFrame:(CGRect)frame arr:(NSMutableArray *)data;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong)UICollectionView *collectView;
@property (nonatomic, copy)void (^middleViewBlock)(NSString *strID);
@property (nonatomic, strong)NSMutableArray *dataArr;
@end
