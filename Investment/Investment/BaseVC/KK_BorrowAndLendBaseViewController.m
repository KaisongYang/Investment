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
#import "KK_PersonInformationViewController.h"
#import "KK_PersonDetailViewController.h"

@interface KK_BorrowAndLendBaseViewController ()

@end

@implementation KK_BorrowAndLendBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView reloadData];
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
    [self toInfo:nil];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return __KKInvestmentManager.curent_investmnet_data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    KK_BorrowAndLendTableViewCell *cell = [KK_BorrowAndLendTableViewCell cellWithTableView:tableView];
    KK_InvestmenModel *model = [__KKInvestmentManager.curent_investmnet_data objectAtIndex:indexPath.row];
    [cell updateInfo:model];
    __weak typeof(self) weakSelf = self;
    cell.actionClick = ^(NSInteger index) {
        switch (index) {
            case 0:
            {
                if (model && model.phone.length) {
                    [weakSelf telPhone:model.phone];
                }
            }
                break;
            case 1:
            {
                [weakSelf toInfo:model];
            }
                break;
            case 2:
            {
                
            }
                break;
            default:
                break;
        }
    };
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self toDetail];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 160;
}

- (void)toDetail {
    KK_PersonDetailViewController *vc = [KK_PersonDetailViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toInfo:(KK_InvestmenModel *)model {
    
    __weak typeof(self) weakSelf = self;
    KK_PersonInformationViewController *vc = [KK_PersonInformationViewController new];
    NSDateFormatter *formater = [NSDateFormatter new];
    formater.dateFormat = @"yyyy-MM-dd- HH:mm";
    if (!model) {
        model = [KK_InvestmenModel new];
        model.ID = [formater stringFromDate:[NSDate date]];
        model.investment_type = @(__KKInvestmentManager.current_investment_type);
        model.borrow_money_info = [[RLMArray alloc] initWithObjectClassName:NSStringFromClass([KK_MoneyInfo class])];
        model.lend_money_info = [[RLMArray alloc] initWithObjectClassName:NSStringFromClass([KK_MoneyInfo class])];
    }else {
        model = [model copy];
    }
    
    if (!model.id_info) {
        model.id_info = [KK_IDInfo new];
    }
    if (!model.bank_card_info) {
        model.bank_card_info = [KK_BankCardInfo new];
    }
    
    vc.model = model;
    vc.actionPassPersonInfo = ^(KK_InvestmenModel *model, BOOL isStore) {
        if (isStore) {
            [__KKInvestmentManager updateInvestmentModel:model toState:InvestmentStateNormal];
            [weakSelf.tableView reloadData];
        }
    };
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)telPhone:(NSString *)phone {
    
    if (phone.length < 1) {
        NSLog(@"--%s-- 电话号码为空", __FUNCTION__);
        return;
    }
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", phone]];
    
    if (![[UIApplication sharedApplication] canOpenURL:url]) {
        NSLog(@"--%s-- 不能打电话", __FUNCTION__);
        return;
    }
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[UIApplication sharedApplication] openURL:url];
    });
}

#pragma mark - setting & getting
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
