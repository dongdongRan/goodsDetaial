//
//  GoodsEvaluationView.m
//  ocCrazy
//
//  Created by LD on 2017/6/29.
//  Copyright © 2017年 LCLWZ. All rights reserved.
//

#import "GoodsEvaluationView.h"

@interface GoodsEvaluationView ()

@end


@implementation GoodsEvaluationView
{
    CGFloat cell_hei;
}

- (instancetype)initWithFrame:(CGRect)frame data:(NSMutableArray *)data totalHei:(CGFloat )hei
{
    self = [super initWithFrame:frame];
    if (self) {
        self.total_hei = hei;
        [self addSubview:self.tabview_d];
        self.tabview_d.delegate = self;
        self.tabview_d.dataSource =self;
        self.tabview_d.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.dataArray  = data;
        
    }
    return self;
}
- (void)setUPdata
{
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsEvaluationMiddleModel *model  = self.dataArray[indexPath.row];
    
    
    return model.cell_hei;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     GoodsEvaluationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GoodsEvaluationCell"];
    if (cell == nil) {
        cell = [[NSBundle  mainBundle] loadNibNamed:@"GoodsEvaluationCell" owner:self options:nil][0];
        
    }
    cell.model  = self.dataArray [indexPath.row];
   // cell.cellHei  = cell_hei;
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}






- (UITableView *)tabview_d
{
    
    if (!_tabview_d) {
        _tabview_d = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT -HEIGHT(33)- 64)style:(UITableViewStylePlain)];
       
    }
    
    return _tabview_d;
}
@end
