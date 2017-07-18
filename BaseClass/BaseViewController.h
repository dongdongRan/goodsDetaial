//
//  BaseViewController.h
//  ocCrazy
//
//  Created by dong on 16/9/2.
//  Copyright © 2016年 dukai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>



/**
 继承自此ViewController的都有统一的背景、navbar格式
 */


/**
 设置标题
 */
-(void)setTitle:(NSString *)title;

/**
 使用默认的返回键
 */
-(void)setDefaultNavLeftBtn;

/**
 设置导航栏右边按钮的文字
 */
- (void)setNavRightBtnWithTitle:(NSString*)title;
- (void)setRedNavRightBtnWithTitle:(NSString*)title;
-(void)setNavRightBtnWithTitle:(NSString*)title enabled:(BOOL)enabled;//是否可点击
/**
 设置导航栏右边按钮的图标
 */
-(void)setNavRightBtnWithImageName:(NSString*)imageName;


/**
 设置导航栏左边按钮的图标
 */
-(void)setNavLeftBtnWithImageName:(NSString*)imageName;


- (void)onTapNavLeftBtn;


- (void)onTapNavRightBtn;
/*vc 公用属性 dong
 */
@property (nonatomic, strong)NSMutableArray *dataDongArray;// vc 数据源
@property (nonatomic, strong)NSMutableArray *vcArray;
@property (nonatomic, assign)BOOL isUpStates;// 上啦下拉状态
@property (nonatomic, copy)NSString *pages; // 当前页数


@end
