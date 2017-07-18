//
//  backBarItem.h
//  MLBKit
//
//  Created by dukai on 15/5/13.
//  Copyright (c) 2015年 杜凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface backBarItem : UIBarButtonItem

+(UIBarButtonItem *)share:(UIViewController *)VC;


+(UIBarButtonItem *)shareRight:(UIViewController *)VCon:(NSString *)string;
+(UIBarButtonItem *)shareleft:(UIViewController *)VCon:(NSString *)string;

@end
