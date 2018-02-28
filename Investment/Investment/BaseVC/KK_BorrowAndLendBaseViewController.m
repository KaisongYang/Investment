//
//  KK_BorrowAndLendBaseViewController.m
//  Investment
//
//  Created by kk on 2018/2/27.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_BorrowAndLendBaseViewController.h"
#import "KK_BorrowAndLendTableViewCell.h"
#import "KK_InvestmenModel.h"
#import "KK_InvestmentManager.h"

@interface KK_BorrowAndLendBaseViewController ()

@end

@implementation KK_BorrowAndLendBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    KK_BorrowAndLendTableViewCell *cell = [KK_BorrowAndLendTableViewCell cellWithTableView:tableView];
    if (__KKInvestmentManager.curent_investmnet_data.count >= indexPath.row + 1) {
        [cell updateInfo:[__KKInvestmentManager.curent_investmnet_data objectAtIndex:indexPath.row]];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

#pragma mark - setting & getting
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 100;
    }
    return _tableView;
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
