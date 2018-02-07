//
//  PersonListViewController.m
//  MiAiApp
//
//  Created by 徐阳 on 2017/7/14.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import "PersonListViewController.h"
#import "PersonListLogic.h"
#import "WaterFlowLayout.h"
#import "PersonListCollectionViewCell.h"
#import "XYTransitionProtocol.h"
#import "UICollectionView+IndexPath.h"
#import "HomeViewController.h"
#import "ProfileViewController.h"
#import "PersonModel.h"

#define itemWidthHeight ((kScreenWidth-30)/2)

@interface PersonListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,WaterFlowLayoutDelegate,XYTransitionProtocol,PersonListLogicDelegate>

@property(nonatomic,strong) PersonListLogic *logic;//逻辑层
@property(nonatomic,strong) UIView *topView;//置顶View

@end

@implementation PersonListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.isShowLiftBack = NO;//每个根视图需要设置该属性为NO，否则会出现导航栏异常
    
//    [PPNetworkHelper closeAES];
    [PPNetworkHelper GET:@"http://app31.app.longcai.net/index.php/interfaces/Goods/gooddetail?uid=59&gid=181" parameters:nil success:^(id responseObject) {
      
    } failure:^(NSError *error) {
        
    }];

    
    
//    //初始化逻辑类
//    _logic = [PersonListLogic new];
//    _logic.delegagte = self;
//    
//    [self setupUI];
//    //开始第一次数据拉取
//    [self.collectionView.mj_header beginRefreshing];
}
- (NSString *)jsonToString:(NSDictionary *)dic
{
    if(!dic){
        return nil;
    }

    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.StatusBarStyle = UIStatusBarStyleLightContent;
}
#pragma mark ————— 初始化页面 —————
-(void)setupUI{
    //添加导航栏按钮
    [self addNavigationItemWithTitles
     :@[@"筛选"] isLeft:NO target:self action:@selector(naviBtnClick:) tags:@[@1000]];
    
    //设置瀑布流布局
    WaterFlowLayout *layout = [WaterFlowLayout new];
    layout.columnCount = 2;
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);;
    layout.rowMargin = 10;
    layout.columnMargin = 10;
    layout.delegate = self;
    

    self.collectionView.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
    [self.collectionView setCollectionViewLayout:layout];
    self.collectionView.backgroundColor = CViewBgColor;
    [self.collectionView registerClass:[PersonListCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([PersonListCollectionViewCell class])];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    
//    [self.view addSubview:self.topView];
}

#pragma mark -  置顶view
-(UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 64+10, KScreenWidth, 37)];
        _topView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(KScreenWidth - 65, 0, 59, 37);
        [btn setImage:IMAGE_NAMED(@"top_icon") forState:UIControlStateNormal];
        [_topView addSubview:btn];
        
        [btn addTarget:self action:@selector(topAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _topView;
}

-(void)topAction{
    [self.collectionView setContentOffset:CGPointMake(0, -64) animated:YES];
}


#pragma mark ————— 下拉刷新 —————
-(void)headerRereshing{
    [_logic.dataArray removeAllObjects];
    [_logic loadData];
}

#pragma mark ————— 上拉刷新 —————
-(void)footerRereshing{
    [_logic loadData];
}

#pragma mark ————— 数据拉取完成 渲染页面 —————
-(void)requestDataCompleted{
    [self.collectionView.mj_footer endRefreshing];
    [self.collectionView.mj_header endRefreshing];
    
//    [UIView performWithoutAnimation:^{
        [self.collectionView reloadData];
//    }];

}

#pragma mark ————— collection代理方法 —————
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _logic.dataArray.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PersonListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([PersonListCollectionViewCell class]) forIndexPath:indexPath];
    cell.personModel = _logic.dataArray[indexPath.row];
    
    return cell;
}

#pragma mark ————— layout 代理 —————
-(CGFloat)waterFlowLayout:(WaterFlowLayout *)WaterFlowLayout heightForWidth:(CGFloat)width andIndexPath:(NSIndexPath *)indexPath{
    PersonModel *personModel = _logic.dataArray[indexPath.row];
    if (personModel.hobbys && personModel.hobbysHeight == 0) {
        //计算hobby的高度 并缓存
        CGFloat hobbyH=[personModel.hobbys heightForFont:FFont1 width:(KScreenWidth-30)/2-20];
        if (hobbyH>43) {
            hobbyH=43;
        }
        personModel.hobbysHeight = hobbyH;
    }
    CGFloat imgH = personModel.height * itemWidthHeight / personModel.width;
    
    return imgH + 110 + personModel.hobbysHeight;
    
}

//*******重写的时候需要走一句话
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PersonModel *model = _logic.dataArray[indexPath.row];
    NSLog(@"问题URL：%@",model.picture);
    
    
    //标记cell
    [self.collectionView setCurrentIndexPath:indexPath];
    
    PersonListCollectionViewCell *cell =(PersonListCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    
    ProfileViewController *profileVC = [ProfileViewController new];
    profileVC.headerImage = cell.imgView.image;
    profileVC.isTransition = YES;
    [self.navigationController pushViewController:profileVC animated:YES];
    
//    SecondViewController *secondVC = [SecondViewController new];
//    secondVC.photoImg = IMAGE_NAMED(_logic.dataArray[indexPath.row]);
//    [self.navigationController pushViewController:secondVC animated:YES];
    //    CellParticularController * con = [CellParticularController new];
    //    [self.navigationController pushViewController:con animated:YES];
}
#pragma mark ————— 转场动画起始View —————
-(UIView *)targetTransitionView{
    NSIndexPath * indexPath = [self.collectionView currentIndexPath];
    PersonListCollectionViewCell *cell =(PersonListCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    return cell.imgView;
}

-(BOOL)isNeedTransition{
    return YES;
}


-(void)naviBtnClick:(UIButton *)btn{
    [self.navigationController pushViewController:[HomeViewController new] animated:YES];
}

#pragma mark -  上下滑动隐藏/显示导航栏

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //scrollView已经有拖拽手势，直接拿到scrollView的拖拽手势
    UIPanGestureRecognizer *pan = scrollView.panGestureRecognizer;
    //获取到拖拽的速度 >0 向下拖动 <0 向上拖动
    CGFloat velocity = [pan velocityInView:scrollView].y;
    NSLog(@"滑动速度 %.f",velocity);
    if (velocity <- 50) {
        //向上拖动，隐藏导航栏
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        self.StatusBarStyle = UIStatusBarStyleDefault;
        [UIView animateWithDuration:0.2 animations:^{
            self.topView.bottom = 0;
        }];
    }else if (velocity > 50) {
        //向下拖动，显示导航栏
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        self.StatusBarStyle = UIStatusBarStyleLightContent;
        [UIView animateWithDuration:0.2 animations:^{
            self.topView.top = 64+10;
        }];
    }else if(velocity == 0){
        //停止拖拽
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
