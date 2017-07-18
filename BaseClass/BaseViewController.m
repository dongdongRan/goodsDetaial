//
//  BaseViewController.m
//  ocCrazy
//
//  Created by dong on 16/9/2.
//  Copyright © 2016年 dukai. All rights reserved.
//

#import "BaseViewController.h"
#import "backBarItem.h"

@interface BaseViewController ()
{
    CGFloat navBarWidth;
    CGFloat navBarHeight;
    
    // 表示之前navBar是否隐藏的
    BOOL oldNavBarHidden;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    self.view.backgroundColor = [Colors sharedColor].colorF6;
    self.pages = @"1";
    self.navigationController.navigationBar.hidden = NO;
    // 设置默认的样式
    oldNavBarHidden = self.navigationController.navigationBarHidden;
    
    [self.navigationController setNavigationBarHidden:NO];

    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[Colors sharedColor].color33}];
    
    navBarWidth = self.navigationController.navigationBar.frame.size.width;
    navBarHeight = self.navigationController.navigationBar.frame.size.height;
    self.navigationController.navigationBar.translucent = NO;
    [self setDefaultNavLeftBtn];
    
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 设置标题
 */
-(void)setTitle:(NSString *)title
{
    [super setTitle:title];
}

/**
 使用默认的返回键
 */
-(void)setDefaultNavLeftBtn
{
    [self setNavLeftBtnWithImageName:@"return"];
    
}

/**
 设置导航栏右边按钮的图标
 */
-(void)setNavRightBtnWithImageName:(NSString*)imageName
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 18, 18 );
    [btn addTarget:self action:@selector(onTapNavRightBtn) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    btn.touchAreaInsets = UIEdgeInsetsMake(20, 20, 0, 20);
    
    UIBarButtonItem *rightBarStarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.navigationItem.rightBarButtonItem = rightBarStarButtonItem;

}

/**
 设置导航栏右边按钮的文字
 */
-(void)setNavRightBtnWithTitle:(NSString*)title
{
//    self.navigationItem.rightBarButtonItem = [backBarItem shareRight:self:title];

    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
   
    [rightBtn setTitle:title forState:UIControlStateNormal];
    
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    rightBtn.touchAreaInsets = UIEdgeInsetsMake(20, 10, 20, 20);
    
    [rightBtn setFrame:CGRectMake(0, 0, [title crazy_returnTextWidth:15] + 10, 20)];
    
    if ([title isEqualToString:@""]) {
        
    }else{
    
        [rightBtn addTarget:self action:@selector(onTapNavRightBtn) forControlEvents:UIControlEventTouchUpInside];
    }
 
    [rightBtn setTitle:title forState:UIControlStateNormal];
    [rightBtn setTitleColor:[Colors sharedColor].colorDefault forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    UIBarButtonItem *rightBarStarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    self.navigationItem.rightBarButtonItem = rightBarStarButtonItem;

    
}

/**
 设置导航栏右边按钮的文字
 */
-(void)setNavRightBtnWithTitle:(NSString*)title enabled:(BOOL)enabled
{
    //    self.navigationItem.rightBarButtonItem = [backBarItem shareRight:self:title];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [rightBtn setTitle:title forState:UIControlStateNormal];
    
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    rightBtn.touchAreaInsets = UIEdgeInsetsMake(20, 10, 20, 20);
    
    [rightBtn setFrame:CGRectMake(0, 0, [title crazy_returnTextWidth:15] + 10, 20)];
    
    if (enabled == NO) {
        rightBtn.enabled = NO;
        [rightBtn setTitleColor:[Colors sharedColor].color99 forState:UIControlStateNormal];
    }else{
        [rightBtn setTitleColor:[Colors sharedColor].colorDefault forState:UIControlStateNormal];
        [rightBtn addTarget:self action:@selector(onTapNavRightBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [rightBtn setTitle:title forState:UIControlStateNormal];
    
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    UIBarButtonItem *rightBarStarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    self.navigationItem.rightBarButtonItem = rightBarStarButtonItem;
    
    
}


/**
 设置导航栏左边按钮的图标
 */
-(void)setNavLeftBtnWithImageName:(NSString*)imageName
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 2, 20, 30);
    [btn addTarget:self action:@selector(onTapNavLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *backBtnIV = [[UIImageView alloc] init];
    CGFloat backBtnFactor = 35.0 / 62.0;
    backBtnIV.frame = CGRectMake(-5, 5, 20 * backBtnFactor, 20);
    backBtnIV.image = [UIImage imageNamed:imageName];
    [btn addSubview:backBtnIV];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"background"] forBarMetrics:UIBarMetricsDefault];

//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn addTarget:self action:@selector(onTapNavLeftBtn) forControlEvents:UIControlEventTouchUpInside];
//    
//
//    CGFloat backBtnFactor = 35.0 / 62.0;
//    btn.frame = CGRectMake(0, 5, 20 * backBtnFactor, 20);
//    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    
//    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
//    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
//    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"background"] forBarMetrics:UIBarMetricsDefault];
    
}





-(void)setRedNavRightBtnWithTitle:(NSString*)title
{
    //self.navigationItem.rightBarButtonItem = [backBarItem shareRight:self:title];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [rightBtn setTitle:title forState:UIControlStateNormal];
    
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    rightBtn.touchAreaInsets = UIEdgeInsetsMake(20, 10, 20, 20);
    
    [rightBtn setFrame:CGRectMake(0, 0, [title crazy_returnTextWidth:15] + 10, 20)];
    
    if ([title isEqualToString:@""]) {
        
    }else{
        
        [rightBtn addTarget:self action:@selector(onTapNavRightBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [rightBtn setTitle:title forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    UIBarButtonItem *rightBarStarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    self.navigationItem.rightBarButtonItem = rightBarStarButtonItem;
    
    
}

- (void)onTapNavLeftBtn
{
    //[SVProgressHUD dismiss];
    [self.view endEditing:YES];
    if ([self.navigationController viewControllers].count == 1) { //若是模态
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

- (void)onTapNavRightBtn
{
    [self.view endEditing:YES];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    
    //[SVProgressHUD dismiss];
    
}

- (NSMutableArray *)dataDongArray
{
    if (_dataDongArray == nil) {
        _dataDongArray  = [NSMutableArray array];
    }
    
    return _dataDongArray;
}
- (NSMutableArray *)vcArray
{
    if (_vcArray  == nil) {
        _vcArray = [NSMutableArray array];
    }
    return _vcArray;
}
@end
