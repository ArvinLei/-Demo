//
//  MainTabbarController.m
//  直播Demo
//
//  Created by simple雨 on 2018/4/28.
//  Copyright © 2018年 simple雨. All rights reserved.
//

#import "MainTabbarController.h"

#import "HomeViewController.h"
#import "MineViewController.h"
#import "LiveListViewController.h"
#import "CategoryListViewController.h"

#import "MainNavigationViewController.h"

@interface MainTabbarController ()

@end

@implementation MainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeViewController *homeVc = [HomeViewController new];
    
    CategoryListViewController *categoryVc = [CategoryListViewController new];
    LiveListViewController *liveVc = [LiveListViewController new];
    MineViewController *mineVc = [MineViewController new];
    
    homeVc.tabBarItem.image = [UIImage imageNamed:@"推荐_默认"];
    homeVc.tabBarItem.selectedImage = [UIImage imageNamed:@"推荐_焦点"];
    homeVc.title = @"推荐";
    
    categoryVc.tabBarItem.image = [UIImage imageNamed:@"栏目_默认"];
    categoryVc.tabBarItem.selectedImage = [UIImage imageNamed:@"栏目_焦点"];
    categoryVc.title = @"栏目";
    
    liveVc.tabBarItem.image = [UIImage imageNamed:@"发现_默认"];
    liveVc.tabBarItem.selectedImage = [UIImage imageNamed:@"发现_焦点"];
    liveVc.title = @"直播";
    
    mineVc.tabBarItem.image = [UIImage imageNamed:@"我的_默认"];
    mineVc.tabBarItem.selectedImage = [UIImage imageNamed:@"我的_焦点"];
    mineVc.title = @"我的";
    
    self.viewControllers = @[UINavi(homeVc),UINavi(categoryVc),UINavi(liveVc),UINavi(mineVc)];
    
    self.tabBar.tintColor = LGMainColor;
}
//询问是否支持旋转
- (BOOL)shouldAutorotate {
    //获取导航控制器 是否支持
    return self.selectedViewController.shouldAutorotate;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return self.selectedViewController.supportedInterfaceOrientations;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
