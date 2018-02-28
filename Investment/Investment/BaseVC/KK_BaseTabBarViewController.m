//
//  KK_BaseTabBarViewController.m
//  Investment
//
//  Created by kk on 2018/2/28.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_BaseTabBarViewController.h"
#import "KK_InvestmentManager.h"

@interface KK_BaseTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation KK_BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController NS_AVAILABLE_IOS(3_0); {
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController; {
    
    __KKInvestmentManager.current_investment_type = tabBarController.selectedIndex+1;
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
