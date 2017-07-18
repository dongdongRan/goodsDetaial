//
//  GoodsEvaluationCell.h
//  ocCrazy
//
//  Created by LD on 2017/6/26.
//  Copyright © 2017年 LCLWZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsEvaluationModel.h"
@interface GoodsEvaluationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img_head;
@property (weak, nonatomic) IBOutlet UILabel *lab_title;
@property (weak, nonatomic) IBOutlet UILabel *lab_time;
@property (weak, nonatomic) IBOutlet UILabel *lab_eva;
@property (weak, nonatomic) IBOutlet UILabel *lab_content;
@property (weak, nonatomic) IBOutlet UIView *view_pic;
@property (weak, nonatomic) IBOutlet UIView *view_gray;

@property (nonatomic, strong)GoodsEvaluationMiddleModel *model;

@property (nonatomic, assign)CGFloat cellHei;

@end
