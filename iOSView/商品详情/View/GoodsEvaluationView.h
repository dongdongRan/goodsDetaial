//
//  GoodsEvaluationView.h
//  ocCrazy
//
//  Created by LD on 2017/6/29.
//  Copyright © 2017年 LCLWZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsEvaluationModel.h"
#import "GoodsEvaluationCell.h"
@interface GoodsEvaluationView : UIView<UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithFrame:(CGRect)frame data:(NSMutableArray *)data totalHei:(CGFloat )hei;

@property (nonatomic, strong)UITableView *tabview_d;
@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic, assign)CGFloat total_hei;
@end
