//
//  XBNavigationViewController.m
//  ocCrazy
//
//  Created by dong on 16/9/2.
//  Copyright © 2016年 dukai. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController


/*
 *  在实例化时，只执行一次
 */
+ (void)initialize{
    
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor  = [UIColor whiteColor];
    bar.translucent = YES;
      
}

@end
