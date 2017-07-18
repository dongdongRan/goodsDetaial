//
//  GoodsDetailsCell.h
//  ocCrazy
//
//  Created by LD on 2017/6/26.
//  Copyright © 2017年 LCLWZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsDetailsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lab_goodsTitle;
@property (weak, nonatomic) IBOutlet UILabel *lab_content;

@property (weak, nonatomic) IBOutlet UILabel *lab_price;

@property (weak, nonatomic) IBOutlet UILabel *lab_count;
@property (weak, nonatomic) IBOutlet UILabel *lab_evaluation;





@end
