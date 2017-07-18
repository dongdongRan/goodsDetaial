//
//  GoodsDetailsTypeCell.m
//  ocCrazy
//
//  Created by LD on 2017/6/28.
//  Copyright © 2017年 LCLWZ. All rights reserved.
//

#import "GoodsDetailsTypeCell.h"

@implementation GoodsDetailsTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [DRAutolayout layoutOfSuperView:self];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
