//
//  GoodsDetailsViewController.h
//  ocCrazy
//
//  Created by LD on 2017/6/26.
//  Copyright © 2017年 LCLWZ. All rights reserved.
//

#import "BaseViewController.h"

#import "GoodsRecommdView.h"
#import "GoodsSectionHeadView.h"
#import "GoodsEvaluationView.h"
#define cellReuseOneGoods @"cellReuseOneGoods"
#define cellReuseTwoGoods @"cellReuseTwoGoods"
#define cellReuseThreeGoods @"cellReuseThreeGoods"
#define cellReuseFourGoods @"cellReuseFourGoods"
#define toolBottom  33
#define imageWide
#define imageHei
@interface GoodsDetailsViewController : BaseViewController
@property (strong, nonatomic) UITableView *tabview_d;
@property (strong, nonatomic)UIScrollView *scrollView;
@property (strong, nonatomic)UIView *secondPageView;
@property (strong, nonatomic)UIWebView *goodsWebView;
@property (nonatomic, strong)GoodsRecommdView *recommdView;
@property (nonatomic, strong)UIScrollView *bottom_Scroview;
@property (nonatomic, strong)GoodsSectionHeadView *headView;
@property (nonatomic, strong)GoodsEvaluationView *evaluationView;
@end
