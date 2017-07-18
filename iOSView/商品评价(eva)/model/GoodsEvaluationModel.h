//
//  GoodsEvaluationModel.h
//  ocCrazy
//
//  Created by mac on 2017/2/10.
//  Copyright © 2017年 longcaiApp项目. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodsEvaluationModel.h"

//avatar = "<null>";
//content = "\U54c8\U54c8\U54c8\U54c8\U54c8";
//id = 1;
//picarr =                 (
//);
//posttime = 1111;
//star = 5;
//username = "<null>";

@interface GoodsEvaluationModel : NSObject

@property (nonatomic, copy)NSString *img;


@end

@interface GoodsEvaluationMiddleModel  : NSObject
@property (nonatomic, copy)NSString *id_;
@property (nonatomic, copy)NSString *posttime;
@property (nonatomic, strong)NSMutableArray *picarr;
@property (nonatomic , copy) NSString *star;
@property (nonatomic ,copy)NSString *username;
@property (nonatomic, copy)NSString *content;
@property (nonatomic, copy)NSString *avatar;
@property (nonatomic, copy)NSString *hidden;
@property (nonatomic, assign)CGFloat lab_hei;
@property (nonatomic, assign)CGFloat img_hei;
@property (nonatomic, assign)CGFloat cell_hei;


@end

@interface GoodsEvaluationBigModel  : NSObject

@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic, copy)NSString *total;


@end
