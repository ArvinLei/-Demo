//
//  MainNavigationViewController.m
//  直播Demo
//
//  Created by simple雨 on 2018/4/28.
//  Copyright © 2018年 simple雨. All rights reserved.
//

#import "MainNavigationViewController.h"

@interface MainNavigationViewController ()

@end

@implementation MainNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //改变导航栏的颜色
    self.navigationBar.barTintColor = LGMainColor;
    //设置title颜色
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    //改变导航栏中按钮的颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
    
}
//设置状态栏 (运行商 电量) 为白色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
- (BOOL)shouldAutorotate {
    //询问最终显示的页面是否支持
    return [self.viewControllers.lastObject shouldAutorotate];
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.viewControllers.lastObject supportedInterfaceOrientations];
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
