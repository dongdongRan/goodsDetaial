//
//  HomeViewController.m
//  demoiOS
//
//  Created by LD on 2017/6/30.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "HomeViewController.h"
#import "GoodsDetailsViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)goods_btn:(id)sender {
    
    GoodsDetailsViewController *vc =[[GoodsDetailsViewController alloc] init];
    [self.navigationController pushViewController:vc  animated:YES];
}
@end
