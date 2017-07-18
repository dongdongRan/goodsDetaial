//
//  DRExtensionHeader.h
//  demoiOS
//
//  Created by LD on 2017/6/30.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

//UIColor
@interface UIColor(crazyColor)

+(UIColor *)crazy_R:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha;
+(UIColor *)crazy_hex:(NSString *)hex A:(CGFloat)alpha;
+(UIColor *)crazy_hex:(NSString *)hex;

@end
//NSString
@interface NSString(crazyStr)
/** 返回字符串的长度*/
-(float)crazy_returnTextWidth:(float)fontSize;
/** 返回字符串的高度*/
-(float)crazy_returnFontSize:(float)fontSize ViewWidth:(float)width;
/** 截取字符串*/
- (NSString *)crazy_subStringStart:(NSString *)start StringEnd:(NSString *)end;
@end


typedef enum {
    horizontal,//高度固定，
    vertical //宽度固定，
}direction;
//UILabel
@interface UILabel(crazyLabel)
/** 自动返回label的高度或者 长度*/
-(CGSize)crazy_text:(NSString *)text Auto:(direction)direction;
/** 使label上的字靠在label左上面*/
-(CGSize)crazy_textToLeftAndTop:(NSString *)text;
@end
//UIView
@interface UIView(crazyView)

-(void)crazy_cornerRadius:(float)Radius;//圆角
-(void)crazy_cornerLineWidth:(float)Width LineColor:(UIColor *)color;//线边
@end
