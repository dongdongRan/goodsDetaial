//
//  DRAutolayout.h
//  DLAutoLayout
//
//  Created by LD on 2017/6/30.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIView(Views)

@property(nonatomic,strong)NSString * mark;
@property (nonatomic, strong, readwrite) NSLayoutConstraint * layout_x;
@property (nonatomic, strong, readwrite) NSLayoutConstraint * layout_y;
@property (nonatomic, strong, readwrite) NSLayoutConstraint * layout_width;
@property (nonatomic, strong, readwrite) NSLayoutConstraint * layout_height;
@end


@interface DRAutolayout : NSObject

@property(nonatomic)float scale;
+(void)layoutOfSuperView:(UIView *)superView;
+(CGFloat)getFontSize:(CGFloat)fontSize;
+(CGFloat)getUIScale;
+(CGFloat)crazyHeight:(float)height;
+(void)frameOfSuperView:(UIView *)superView;//适配view(frame)



@end
