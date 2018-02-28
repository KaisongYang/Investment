//
//  KK_LendMoneyViewController.m
//  Investment
//
//  Created by kk on 2018/2/27.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_LendMoneyViewController.h"

@interface KK_LendMoneyViewController ()

@end

@implementation KK_LendMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavBar];
}

- (void)setNavBar {
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [addBtn setTitle:@"添加" forState:UIControlStateNormal];
    [addBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [addBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [addBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addBtn];
}

- (void)btnClick:(UIButton *)sender {
    
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
