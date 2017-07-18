//
//  DongPicBigView.h
//  ocCrazy
//
//  Created by lidong on 2016/12/6.
//  Copyright © 2016年 longcaiApp项目. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SDAutoLayout.h"

#import "SDPhotoBrowser.h"
@interface DongPicBigView : UIView<SDPhotoBrowserDelegate>
@property (nonatomic, strong) NSArray *picPathStringsArray;
@property (nonatomic, strong) NSArray *imageViewsArray;
@end
