//
//  GoodsDetailsViewController.m
//  ocCrazy
//
//  Created by LD on 2017/6/26.
//  Copyright © 2017年 LCLWZ. All rights reserved.
//

#import "GoodsDetailsViewController.h"
#import "backBarItem.h"
#import "GoodsDetailsCell.h"
#import "GoodsDetailsTypeCell.h"
#import "GoodsEvaluationCell.h"
#import "GoodsRecommdCell.h"
#import "GoodsModel.h"
#import "GoodsEvaluationModel.h"
@interface GoodsDetailsViewController ()

@property (nonatomic, strong)NSMutableArray *recommd_Arr;
@property (nonatomic, strong)NSMutableArray *eva_Arr;
@end


@implementation GoodsDetailsViewController
{
    NSInteger numRow ;
    
    CGFloat evaTotal_Hei;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    [self setUPData];
    [self setNavRightBtnWithImageName:@""];
    [self setUpParams];
    [self setUPrecommdView];
    [self setUPHead];
    [self setUpTab];
    [self setUPRefresh];
    
}
- (void)setUPData
{
    
    NSArray *lab = @[@"lasjflajflkajlfkajlkfkaj", @"alksfj很快就安徽客服哈客户卡回复阿卡复活卡好地方卡司法局卡号及开放打火机开发环境看见客户积分卡号艰苦奋斗黄金卡活动经费卡号的卡号开发哈接口 阿拉斯加福利卡设计费拉数据库了发动机阿里 ", @"alkjsflwejoiawjfo", @"iwjfoipwjfiowajio啊;饭卡快疯了;按时发令肌肤垃圾袋福利卡就上课了发进口量的房间爱了肯德基付款啦数据库劳动法接口连接方可垃圾罚款拉进来的房间爱了f"];
    
    evaTotal_Hei = 0;
    int value = (arc4random() % 20) + 2;
    for (int i = 0 ;i < value; i++) {
        
        GoodsEvaluationMiddleModel *model = [[GoodsEvaluationMiddleModel alloc] init];
        model.content =lab[arc4random() % 3];
        model.lab_hei = [model.content crazy_returnFontSize:[DRAutolayout getFontSize:13] ViewWidth:HEIGHT(300)];
        
        
        model.picarr = [NSMutableArray array];
        int value1 = (arc4random() % 13) + 4;
        for (int  i = 1; i < value1; i++) {
            
            [model.picarr addObject:[NSString stringWithFormat:@"%@%d", @"cp", i]];
        }
        model.img_hei = [self setUPImagHei:model];
        model.cell_hei  = model.lab_hei  + model.img_hei + HEIGHT(105) + 10;
        evaTotal_Hei = evaTotal_Hei  + model.cell_hei;
        [self.eva_Arr addObject:model];
    }
    

}
- (CGFloat)setUPImagHei:(GoodsEvaluationMiddleModel *)model
{
    NSInteger imgcount = model.picarr.count;
    CGFloat ImgHegight;
    
    if (imgcount %4 == 0) {
        
        ImgHegight = imgcount/4 *HEIGHT(56) + (imgcount/4 - 1) *HEIGHT(10);
        
    }else
    {
        if (imgcount /4 == 0 ) {
            
            ImgHegight = HEIGHT(56);
        }else
        {
            
            ImgHegight = (imgcount/4 +1) *HEIGHT(56) + imgcount/4 *HEIGHT(10);
        }
        
        
    }
    
    return ImgHegight;

}
- (void)setUpParams
{
    self.navigationItem.title  = @"商品详情";
    numRow = 4;
}
- (void)setUpTab
{
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.tabview_d];
    [self.scrollView addSubview:self.secondPageView];
    [self.secondPageView addSubview:self.goodsWebView];
     self.evaluationView = [[GoodsEvaluationView alloc] initWithFrame:CGRectMake(0, HEIGHT(toolBottom), SCREEN_WIDTH, SCREEN_HEIGHT - HEIGHT(toolBottom) -DSTATUSBAR_NAVIGATION_HEIGHT)data:self.eva_Arr totalHei:evaTotal_Hei ];
    
    [self.secondPageView addSubview:self.evaluationView];
    self.evaluationView.hidden  = YES;
    self.tabview_d.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}
- (void)setUPHead
{
    self.headView = [[NSBundle mainBundle] loadNibNamed:@"GoodsSectionHeadView" owner:self options:nil][0];
    
    [DRAutolayout frameOfSuperView:self.headView];
    
    LRWeakSelf(self);
    [self.headView returnHeadBtn:^(NSInteger tag) {
        
        if (tag == 100) {
            _goodsWebView.hidden  =NO;
            weakself.evaluationView.hidden = YES;
        }else
        {
            _goodsWebView.hidden = YES;
            weakself.evaluationView.hidden = NO;
        }
    
        
        
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  numRow;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row ==0) {return HEIGHT(283);
        
    }if (indexPath.row ==1){return HEIGHT(75);
        
    }if (indexPath.row == 2){
        GoodsEvaluationMiddleModel *model =self.eva_Arr[0];
        return model.cell_hei;
    }if (indexPath.row == 3) { return HEIGHT(200);
        
    }
    
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        GoodsDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseOneGoods];

        return cell;
    }
    if (indexPath.row == 1){
      
        GoodsDetailsTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseTwoGoods];
        return cell;
        
    }
    if (indexPath.row == 2) {
        
        GoodsEvaluationCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseThreeGoods];
        cell.model  = self.eva_Arr [0];
        
        return cell;
    }
    if (indexPath.row == 3) {
        
        GoodsRecommdCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseFourGoods];
        [cell addSubview:self.recommdView];
        return cell;
    }

    
    
    
    return nil;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    

}

-(void)onTapNavRightBtn
{
    
    
}

- (void)setUPRefresh {
    // 动画时间
    CGFloat duration = 0.3f;
    
    // 1.设置 UITableView 上拉显示商品详情
    MJRefreshBackGifFooter *footer = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
        [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            self.scrollView.contentOffset = CGPointMake(0, self.scrollView.height);
        } completion:^(BOOL finished) {
            [self.tabview_d.mj_footer endRefreshing];
        }];
    }];
    footer.automaticallyHidden = YES; // 关闭自动隐藏(若为YES，cell无数据时，不会执行上拉操作)
    footer.stateLabel.backgroundColor = self.tabview_d.backgroundColor;
//    [footer setTitle:@"继续拖动，查看图文详情" forState:MJRefreshStateIdle];
//    [footer setTitle:@"松开，即可查看图文详情" forState:MJRefreshStatePulling];
//    [footer setTitle:@"松开，即可查看图文详情" forState:MJRefreshStateRefreshing];
   self.tabview_d.mj_footer = footer;
    footer.stateLabel.hidden  = YES;
    
    // 2.设置 UIWebView 下拉显示商品详情
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        //设置动画效果
        [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            self.scrollView.contentOffset = CGPointMake(0, 0);
        } completion:^(BOOL finished) {
            //结束加载
            [self.goodsWebView.scrollView.mj_header endRefreshing];
        }];
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 设置文字、颜色、字体
    [header setTitle:@"下拉，返回商品简介" forState:MJRefreshStateIdle];
    [header setTitle:@"释放，返回商品简介" forState:MJRefreshStatePulling];
    [header setTitle:@"释放，返回商品简介" forState:MJRefreshStateRefreshing];
    header.stateLabel.textColor = [UIColor redColor];
    header.stateLabel.font = [UIFont systemFontOfSize:12.f];
    self.goodsWebView.scrollView.mj_header = header;
    [self.goodsWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    
    
    
    
    MJRefreshGifHeader *header1 = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        //设置动画效果
        [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            self.scrollView.contentOffset = CGPointMake(0, 0);
        } completion:^(BOOL finished) {
            //结束加载
            [self.evaluationView.tabview_d.mj_header endRefreshing];
        }];
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 设置文字、颜色、字体
    [header1 setTitle:@"下拉，返回商品简介" forState:MJRefreshStateIdle];
    [header1 setTitle:@"释放，返回商品简介" forState:MJRefreshStatePulling];
    [header1 setTitle:@"释放，返回商品简介" forState:MJRefreshStateRefreshing];
    header1.stateLabel.textColor = [UIColor redColor];
    header1.stateLabel.font = [UIFont systemFontOfSize:12.f];
    self.evaluationView.tabview_d.mj_header = header1;
  
}

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT - DSTATUSBAR_NAVIGATION_HEIGHT)];
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH ,(SCREEN_HEIGHT -
                                                            DSTATUSBAR_NAVIGATION_HEIGHT) * 2);
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = NO;
    }
    
    return _scrollView;
    
}
- (UITableView *)tabview_d
{
    if (!_tabview_d) {
        _tabview_d = [[UITableView alloc] initWithFrame:self.scrollView.bounds style:UITableViewStylePlain];
        _tabview_d.delegate = self;
        _tabview_d.dataSource = self;
        UINib *nib = [UINib nibWithNibName:@"GoodsDetailsCell" bundle:nil];
        [_tabview_d registerNib:nib forCellReuseIdentifier:cellReuseOneGoods];
        UINib *nib1 = [UINib nibWithNibName:@"GoodsDetailsTypeCell" bundle:nil];
        [_tabview_d registerNib:nib1 forCellReuseIdentifier:cellReuseTwoGoods];
        UINib *nib2 = [UINib nibWithNibName:@"GoodsEvaluationCell" bundle:nil];
        [_tabview_d registerNib:nib2 forCellReuseIdentifier:cellReuseThreeGoods];
        UINib *nib3 = [UINib nibWithNibName:@"GoodsRecommdCell" bundle:nil];
        [_tabview_d registerNib:nib3 forCellReuseIdentifier:cellReuseFourGoods];
    }
    return _tabview_d;
}
- (void)setUPrecommdView
{
    self.recommd_Arr  =[NSMutableArray array];
    for (int i = 0; i < 20; i ++ ) {
        
        GoodsModel *Model = [[GoodsModel alloc] init];
        Model.goods_title = @"加";
        [self.recommd_Arr addObject:Model];
    }
    
    _recommdView = [[GoodsRecommdView alloc] initWithFrame:CGRectMake(0, HEIGHT(34), SCREEN_WIDTH, HEIGHT(132)) arr:self.recommd_Arr];
}

- (UIView *)secondPageView
{
    if (!_secondPageView) {
        _secondPageView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tabview_d.frame), self.tabview_d.width, self.tabview_d.height)];
        
        [_secondPageView addSubview:self.headView];
        
    }
    return _secondPageView;
    
}
- (UIWebView *)goodsWebView {
    if (!_goodsWebView) {
         _goodsWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, HEIGHT(toolBottom), self.tabview_d.width, self.tabview_d.height)];
    }
     return _goodsWebView;
}
- (NSMutableArray *)eva_Arr
{
    if (!_eva_Arr) {
        
        _eva_Arr  =[NSMutableArray array];
        
    }
    return _eva_Arr;
}
@end
