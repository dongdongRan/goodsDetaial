//
//  Colors.m
//  ocCrazy
//
//  Created by Scorpio on 2016/12/15.
//  Copyright © 2016年 dukai. All rights reserved.
//

#import "Colors.h"

@implementation Colors

+ (Colors *)sharedColor
{
    static Colors *sharedColor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedColor = [[self alloc] init];
    });
    return sharedColor;
}
- (id)init
{
    if (self = [super init]) {
        
        [self writeColorConfiguration];
        
    }
    return self;
}

//初始化设置
- (void)writeColorConfiguration{
    
    self.colorDefault = [UIColor crazy_hex:@"#f22e3c"];
    self.color33 = [UIColor crazy_hex:@"#333333"];
    self.color66 = [UIColor crazy_hex:@"#666666"];
    self.color99 = [UIColor crazy_hex:@"#999999"];
    self.colorTitle = [UIColor crazy_hex:@"#4e4e4e"];
    self.colorDetail = [UIColor crazy_hex:@"#b6b6b6"];
    self.colorLine = [UIColor crazy_hex:@"#d3d3d3"];
    self.colorViewBack = [UIColor crazy_hex:@"#f5f5f5"];
    self.coloreb = [UIColor crazy_hex:@"#ebebeb"];
    self.colorBlub = [UIColor crazy_hex:@"#148cd8"];
    self.colorYellow = [UIColor crazy_hex:@"#E1782B"];
    self.colorDE = [UIColor crazy_hex:@"#DEDEDE"];
    self.colorRed = [UIColor crazy_hex:@"#FF5000"];
    self.colorF6 = [UIColor crazy_hex:@"#F6F6F6"];
}

@end
