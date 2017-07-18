//
//  DRExtensionHeader.m
//  demoiOS
//
//  Created by LD on 2017/6/30.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DRExtensionHeader.h"
#import "UIColor+Chameleon.h"
static UILabel *staticLabel = nil;
@implementation UIColor(crazyColor)

+(UIColor *)crazy_R:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha{
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha ];
}
+(UIColor *)crazy_hex:(NSString *)hex A:(CGFloat)alpha{
    return  [UIColor colorWithHexString:hex withAlpha:alpha];
}
+(UIColor *)crazy_hex:(NSString *)hex{
    return  [UIColor colorWithHexString:hex];
}

@end
@implementation NSString(crazyStr)

-(float)crazy_returnTextWidth:(float)fontSize{
    
    if (staticLabel == nil) {
        staticLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    }
    
    staticLabel.numberOfLines =0;
    staticLabel.lineBreakMode = NSLineBreakByWordWrapping;
    staticLabel.text = self;
    staticLabel.font = [UIFont systemFontOfSize:fontSize];
    
    CGSize size = [staticLabel sizeThatFits:CGSizeMake(MAXFLOAT,0 )];
    
    return size.width;
}
-(float)crazy_returnFontSize:(float)fontSize ViewWidth:(float)width{
    
    if (staticLabel == nil) {
        staticLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    }
    
    staticLabel.numberOfLines = 0;
    staticLabel.lineBreakMode = NSLineBreakByWordWrapping;
    staticLabel.text = self;
    staticLabel.font = [UIFont systemFontOfSize:fontSize];
    
    CGSize size = [staticLabel sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    
    return size.height;
    
}

- (NSString *)crazy_subStringStart:(NSString *)start StringEnd:(NSString *)end{
    
    NSRange startRange = [self rangeOfString:start];
    NSRange endRange = [self rangeOfString:end];
    NSString *subStr = @"";
    if (startRange.length > 0 && endRange.length > 0) {
        subStr = [self substringWithRange:NSMakeRange(startRange.location + startRange.length, endRange.location - (startRange.location + startRange.length) )];
    }else if (startRange.length > 0 && endRange.length == 0){
        subStr = [self substringFromIndex:startRange.location + startRange.length];
    }else if (startRange.length == 0 && endRange.length > 0){
        subStr = [self substringToIndex:endRange.location];
    }
    return subStr;
}
@end
//UILabel
@implementation UILabel(crazyLabel)

-(CGSize)crazy_text:(NSString *)text Auto:(direction)direction{
    self.numberOfLines =0;
    self.lineBreakMode = NSLineBreakByWordWrapping;
    self.text = text;
    
    CGRect rect = self.frame;
    CGSize size;
    if (direction == horizontal){
        size = [self sizeThatFits:CGSizeMake(MAXFLOAT, self.frame.size.height)];
        self.frame =CGRectMake(rect.origin.x, rect.origin.y, size.width, rect.size.height);
        self.layout_width.constant = size.height;
        
    }else if (direction == vertical){
        size = [self sizeThatFits:CGSizeMake(self.frame.size.width, MAXFLOAT)];
        self.frame =CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, size.height);
        //self.layout_height.constant = size.height;
    }
    
    return size;
}


-(CGSize)crazy_textToLeftAndTop:(NSString *)text{
    self.numberOfLines = 2;
    self.lineBreakMode = NSLineBreakByWordWrapping;
    self.text = text;
    
    CGRect rect = self.frame;
    CGSize size;
    size = [self sizeThatFits:CGSizeMake(self.frame.size.width, MAXFLOAT)];
    self.frame =CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, size.height);
    self.layout_height.constant = size.height;
    
    return size;
}

@end
@implementation UIView(crazyView)

-(void)crazy_cornerRadius:(float)Radius{
    self.layer.cornerRadius = Radius;
    self.clipsToBounds = YES;
}
-(void)crazy_cornerLineWidth:(float)Width LineColor:(UIColor *)color{
    self.layer.borderWidth = Width;
    self.layer.borderColor = color.CGColor;
}
@end

