//
//  GoodsDetailsCell.m
//  ocCrazy
//
//  Created by LD on 2017/6/26.
//  Copyright © 2017年 LCLWZ. All rights reserved.
//

#import "GoodsDetailsCell.h"

@implementation GoodsDetailsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [DRAutolayout layoutOfSuperView:self];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
