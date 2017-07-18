//
//  GoodsEvaluationModel.m
//  ocCrazy
//
//  Created by mac on 2017/2/10.
//  Copyright © 2017年 longcaiApp项目. All rights reserved.
//

#import "GoodsEvaluationModel.h"

@implementation GoodsEvaluationModel






@end



@implementation GoodsEvaluationMiddleModel

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"id_":@"id"};
    
}

//+ (NSDictionary *)objectClassInArray
//{
//    
//    return @{@"picarr":[GoodsEvaluationModel class]};
//}




@end


@implementation GoodsEvaluationBigModel


+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"dataArray":@"data"};
    
}
+ (NSDictionary *)objectClassInArray
{
    
    return @{@"dataArray":[GoodsEvaluationMiddleModel class]};
}
@end
