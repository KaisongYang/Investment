//
//  KK_TabBarViewController.m
//  Investment
//
//  Created by 杨开松 on 2018/3/10.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_TabBarViewController.h"

@interface KK_TabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation KK_TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    __KKInvestmentManager.current_investment_type = tabBarController.selectedIndex;
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
