//
//  GoodsEvaluationCell.m
//  ocCrazy
//
//  Created by LD on 2017/6/26.
//  Copyright © 2017年 LCLWZ. All rights reserved.
//

#import "GoodsEvaluationCell.h"
#import "DongPicBigView.h"
@implementation GoodsEvaluationCell
{
    DongPicBigView *_picContainerView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [DRAutolayout  layoutOfSuperView:self];
    [_img_head crazy_cornerRadius:_img_head.frame.size.width/2];
    self.selectionStyle  = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}
- (void)setModel:(GoodsEvaluationMiddleModel *)model
{
    _model  = model;

   _lab_content.font = [UIFont systemFontOfSize:[DRAutolayout getFontSize:13]];

   [_lab_content crazy_text:_model.content Auto:vertical];
    
    
    _picContainerView = [DongPicBigView new];
    [self.contentView addSubview:_picContainerView];
    CGFloat picContainerTopMargin = 0;
    if (model.picarr.count) {
        picContainerTopMargin = 10;
    }

    _picContainerView.sd_layout.topSpaceToView(_lab_content, picContainerTopMargin).leftEqualToView(_lab_content);
    _picContainerView.picPathStringsArray =  _model.picarr;
    
    _view_gray.sd_layout.topSpaceToView(_picContainerView, 0).leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(HEIGHT(10));
    NSLog(@"%lf", _picContainerView.frame.size.height);
   
    _cellHei =  _model.lab_hei + _picContainerView.frame.size.height  + HEIGHT(120);
}
@end
