//
//  TabBarController.m
//  ocCrazy
//
//  Created by dong on 16/9/2.
//  Copyright © 2016年 dukai. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationViewController.h"

#import "HomeViewController.h"


static TabBarController *tab =nil;
@interface TabBarController ()

@end

@implementation TabBarController



+(TabBarController *)share{
    if (tab ==nil) {
        tab = [[TabBarController alloc]init];
        
    }
    return tab;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    
    
    
    NavigationViewController *home = [[NavigationViewController alloc]initWithRootViewController:homeVC];
    

        //设置右滑返回
        for(UINavigationController *navi in @[home]){
            if ([navi respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
                navi.interactivePopGestureRecognizer.delegate = nil;
            }
        }
    
    [self setTabBarItemController:home title:@"首页" imageName:@"d_1@2x.png" imageslectName:@"d_11@2x.png"];
    
    
    
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
    // self.tabBar.selectedImageTintColor = UIColorFromRGB(0xe21314);
    NSArray * arr_navi = @[home];
    self.viewControllers = arr_navi;
    
    // tabbar分割线颜色
    CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context,
                                       UIColorFromRGB(0xdedede).CGColor);
    
//    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setShadowImage:img];
    [self.tabBar setBackgroundImage:[[UIImage alloc]init]];
    UINavigationBar * nav = [UINavigationBar appearance];
    //设置导航字体和颜色
    [nav setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[Colors sharedColor].color33}];
    
//    self.selectedIndex = 2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setTabBarItemController:(UINavigationController *)navi  title:(NSString *)title imageName:(NSString *)imageName imageslectName:(NSString *)imageslectName{
    
    NSDictionary *firstDict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    navi.navigationBar.titleTextAttributes = firstDict;
   // [navi.navigationBar setBackgroundImage:[UIImage imageNamed:@"navibackImage.png"] forBarMetrics:UIBarMetricsDefault];
    
    [navi.tabBarItem setTitle:title];
    
    UIImage *image = [UIImage
                         imageNamed:imageName];
    
    image = [image imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    
    [navi.tabBarItem setImage:image];
    
    
    UIImage *imgesele = [UIImage
                         imageNamed:imageslectName];
    imgesele = [imgesele imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    [navi.tabBarItem setSelectedImage:imgesele];
    
    [[UITabBarItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:defaultColor,                                                                                                          NSForegroundColorAttributeName, nil]
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      defaultColor,
      NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    
}

-(void)tabBarControllerSelectIndex:(int)selectIndex{
    
    self.selectedIndex = selectIndex;
    
}

@end
