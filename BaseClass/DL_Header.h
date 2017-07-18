//
//  DL_Header.h
//  DLAutoLayout
//
//  Created by LD on 2017/6/30.
//  Copyright © 2017年 mac. All rights reserved.
//

#ifndef DL_Header_h
#define DL_Header_h

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//十六进制方式设置rgb
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



//colors
#define defaultColor  UIColorFromRGB(0xf22e3c)

#define HEIGHT(f) f * ([UIScreen mainScreen].bounds.size.width/320.0)


// 状态栏高度
#define DSTATUSBAR_HEIGHT            (20.f)
// 导航栏高度
#define DNAVIGATION_HEIGHT           (44.f)
// 导航栏高度 + 状态栏高度
#define DSTATUSBAR_NAVIGATION_HEIGHT (64.f)
// 标签栏高度
#define DTABBAR_HEIGHT               (49.f)
// 英文键盘
#define DEYBOARD_HEIGHT_ENGLISH      (216.0f)
// 中文键盘
#define DKEYBOARD_HEIGHT_CHINESE     (252.0f)

#define LRWeakSelf(type)  __weak typeof(type) weak##type = type
#endif /* DL_Header_h */
