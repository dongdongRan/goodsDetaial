//
//  Colors.h
//  ocCrazy
//
//  Created by Scorpio on 2016/12/15.
//  Copyright © 2016年 dukai. All rights reserved.
//

#import <Foundation/Foundation.h>



#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

//十六进制方式设置rgb
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


//#define Color66  UIColorFromRGB(0x666666)
//#define naviColor  UIColorFromRGB(0x1e2330)

@interface Colors : NSObject


+ (Colors *)sharedColor;

@property (nonatomic, strong) UIColor * colorDefault;//主色
@property (nonatomic, strong) UIColor * color33;//导航栏标题颜色
@property (nonatomic, strong) UIColor * color66;
@property (nonatomic, strong) UIColor * color99;
@property (nonatomic, strong) UIColor * colorTitle;//主标题颜色
@property (nonatomic, strong) UIColor * colorDetail;//副标题颜色
@property (nonatomic, strong) UIColor * colorLine;//分割线颜色
@property (nonatomic, strong) UIColor * colorViewBack;//view背景色
@property (nonatomic, strong) UIColor * coloreb;//灰色
@property (nonatomic, strong) UIColor * colorBlub;//蓝色
@property (nonatomic, strong) UIColor * colorYellow;//黄色
@property (nonatomic, strong) UIColor * colorDE;//
@property (nonatomic, strong) UIColor * colorRed;//
@property (nonatomic, strong) UIColor * colorF6;//
@end
