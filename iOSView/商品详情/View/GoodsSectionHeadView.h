//
//  GoodsSectionHeadView.h
//  ocCrazy
//
//  Created by lidong on 2016/12/1.
//  Copyright © 2016年 longcaiApp项目. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^headViewBtn)(NSInteger tag);

@interface GoodsSectionHeadView : UIView
- (IBAction)imgTextBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *imgTextView;
@property (weak, nonatomic) IBOutlet UIView *goodsA;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

@property (nonatomic, copy)headViewBtn headBtn;

- (void)returnHeadBtn:(headViewBtn)btn;

@end
