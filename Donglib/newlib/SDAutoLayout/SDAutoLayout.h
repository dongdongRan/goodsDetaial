//
//  SDAutoLayout.h
//  SDAutoLayoutDemo
//
//  Created by gsd on 16/6/27.
//  Copyright © 2016年 gsd. All rights reserved.
//


/*
 
 SDAutoLayout
 版本：2.1.3
 发布：2016.07.06
 
 */

#ifndef SDAutoLayout_h
#define SDAutoLayout_h

#import "UIView+SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

#endif

/*
 用法二 （一行代码搞定，其实用法一也是一行代码
_view.sd_layout.leftSpaceToView(self.view, 10).topSpaceToView(self.view,80).heightIs(130).widthRatioToView(self.view, 0.4);

 
 subview1.sd_layout
 .leftSpaceToView(self.view1, 10)
 .rightSpaceToView(self.view1, 10)
 .topSpaceToView(self.view1, 10)
 .autoHeightRatio(0); // 设置文本内容自适应，如果这里的参数为大于0的数值则会以此数值作为view的高宽比设置view的高度
 
 autoWidthlabel.sd_layout //没有设置UI宽度 则根据文字长度自动适应
 .rightSpaceToView(self.view, 10)
 .heightIs(20)
 .bottomSpaceToView(self.view, 50);
 
 [autoWidthlabel setSingleLineAutoResizeWithMaxWidth:180];//设置UI最大宽度
 
 btn.sd_layout
 .centerXEqualToView(self.view)
 .topSpaceToView(self.view1, 20);
 
 // 设置button根据文字size自适应
 [btn setupAutoSizeWithHorizontalPadding:10 buttonHeight:25];
 
 // 开启动画
 [UIView animateWithDuration:0.8 animations:^{
 self.view0.sd_layout
 .widthRatioToView(self.view, _widthRatio);
 [self.view0 updateLayout]; // 调用此方法开启view0动画效果
 [self.view5 updateLayout]; // 调用此方法开启view5动画效果
 //
 调用[self.view0 updateLayout]就可以实现view0和其它兄弟view一起动画，view0和view5是父子关系，如果view0需要动画要再主动调用一次[self.view5 updateLayout]
 }];
 
 
 // 设置圆角
 self.view0.sd_cornerRadiusFromHeightRatio = @(0.5); // 设置view0的圆角半径为自身高度的0.5倍
 
 
 
 
 //cell 自适应 
 // 当你不确定哪个view在自动布局之后会排布在cell最下方的时候可以调用次方法将所有可能在最下方的view都传过去
 cell 布局完事 最后加这句
 [self setupAutoHeightWithBottomViewsArray:@[_titleLabel, _imageView] bottomMargin:margin];
 
 ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     
     //最后加
     [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
 }

 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
 {
    //最后加
 
    Class currentClass = [DemoVC7Cell class];
    // 推荐使用此普通简化版方法（一步设置搞定高度自适应，性能好，易用性好）
    model是text时    keyPath为text
    return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:currentClass contentViewWidth:[self cellContentViewWith]];
 }
 
 */
