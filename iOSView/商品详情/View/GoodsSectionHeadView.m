//
//  GoodsSectionHeadView.m
//  ocCrazy
//
//  Created by lidong on 2016/12/1.
//  Copyright © 2016年 longcaiApp项目. All rights reserved.
//

#import "GoodsSectionHeadView.h"

@implementation GoodsSectionHeadView

- (void)returnHeadBtn:(headViewBtn)btn
{
    
    
    self.headBtn = btn;
}
- (IBAction)imgTextBtn:(UIButton *)sender {
    
    
    if (sender.tag == 100) {
        
        _imgTextView.backgroundColor  = UIColorFromRGB(0xff5000);
        _leftLabel.textColor = [UIColor whiteColor];
        
        _goodsA.backgroundColor  = [UIColor whiteColor];
        
        _rightLabel.textColor = UIColorFromRGB(0x333333);
        [self setStrFont:_rightLabel.text];
        self.imgTextView.sd_layout.topSpaceToView(self, 0).leftSpaceToView(self,0).widthIs(HEIGHT(160)).heightIs(HEIGHT(33));
    }else
    {
        
        _imgTextView.backgroundColor  =  [UIColor whiteColor];
        _leftLabel.textColor = UIColorFromRGB(0x333333);
        
        
        _goodsA.backgroundColor  =  UIColorFromRGB(0xff5000);
        
        _rightLabel.textColor =  [UIColor whiteColor];
        
        self.imgTextView.sd_layout.topSpaceToView(self, 1).leftSpaceToView(self,0).widthIs(HEIGHT(160)).heightIs(HEIGHT(31));
        
    }
   
    self.headBtn(sender.tag);
}
- (void)setStrFont:(NSString  *)title
{
    NSString *contentStr =  title;
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:contentStr];
    //设置：在0-3个单位长度内的内容显示成红色
    [str addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0xff50000) range:NSMakeRange(5,str.length-6)];
    _rightLabel.attributedText= str;
}


@end
