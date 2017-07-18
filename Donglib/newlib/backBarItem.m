//
//  backBarItem.m
//  MLBKit
//
//  Created by dukai on 15/5/13.
//  Copyright (c) 2015年 杜凯. All rights reserved.
//

#import "backBarItem.h"
static backBarItem *backItem = nil;
@implementation backBarItem

/**
    修改导航返回按钮
 */
+(UIBarButtonItem *)share:(UIViewController *)VC{
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"deeee.png"] forState:UIControlStateNormal];
    [leftBtn setFrame:CGRectMake(0, 0, 25, 25.5)];
    [leftBtn addTarget:VC action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    backItem = [[backBarItem alloc]initWithCustomView:leftBtn];
    return backItem;
}
+(UIBarButtonItem *)shareRight:(UIViewController *)VCon:(NSString *)string{
    

    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [rightBtn setFrame:CGRectMake(0, 0, 80, 20)];
    [rightBtn addTarget:VCon action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitle:string forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setTitleColor:defaultColor forState:UIControlStateNormal];
    backItem = [[backBarItem alloc]initWithCustomView:rightBtn];
    return backItem;


}
+(UIBarButtonItem *)shareleft:(UIViewController *)VCon:(NSString *)string{
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",string]] forState:UIControlStateNormal];
   // [rightBtn setTitle:string forState:UIControlStateNormal];
    
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //    rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [rightBtn setFrame:CGRectMake(0, 0, 30, 20)];
    [rightBtn addTarget:VCon action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
   // [rightBtn setTitle:string forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    backItem = [[backBarItem alloc]initWithCustomView:rightBtn];
    return backItem;
    
}





@end
