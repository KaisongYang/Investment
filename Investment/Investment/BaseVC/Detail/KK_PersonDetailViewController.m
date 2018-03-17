//
//  KK_PersonDetailViewController.m
//  Investment
//
//  Created by kk on 2018/2/28.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_PersonDetailViewController.h"
#import "KK_PersonDetailTableViewCell.h"
#import "KK_SegmentView.h"
#import "KK_PersonInformationViewController.h"
@interface KK_PersonDetailViewController ()
@property (nonatomic, strong) KK_SegmentView *segmentView;
@end

@implementation KK_PersonDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView reloadData];
    [self setNavBar];
}

- (void)setNavBar {
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
}

- (void)btnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (__KKInvestmentManager.current_investment_type == InvestmentTypeBorrow) {
        return 1 + self.model.borrow_money_info.count;
    }
    return 1 + self.model.lend_money_info.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        KK_PersonDetailTableViewCell *cell = [KK_PersonDetailTableViewCell cellWithTableView:tableView];
        cell.model = self.model;
        return cell;
    }
    KK_PersonDetailBorrowAndLendCell *cell = [KK_PersonDetailBorrowAndLendCell cellWithTableView:tableView];
    if (__KKInvestmentManager.current_investment_type == InvestmentTypeBorrow) {
        cell.model = self.model.borrow_money_info[indexPath.row-1];
    }else {
        cell.model = self.model.lend_money_info[indexPath.row-1];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return [KK_PersonDetailTableViewCell cellHeight];
    }
    return [KK_PersonDetailBorrowAndLendCell cellHeight];
}

#pragma mark - setting & getting
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.bottom.mas_equalTo(self.segmentView.mas_top);
        }];
    }
    return _tableView;
}

- (KK_SegmentView *)segmentView {
    if (!_segmentView) {
        _segmentView = [[KK_SegmentView alloc] initWithTitles:@[@"电话", @"编辑", @"新增"] images:@[]];
        _segmentView.backgroundColor = [UIColor whiteColor];
        __weak typeof(self) weakSelf = self;
        _segmentView.actionClick = ^(NSInteger index) {
            switch (index) {
                case 0:
                {
                    if (weakSelf.model && weakSelf.model.phone.length) {
                        [weakSelf telPhone:weakSelf.model.phone];
                    }
                }
                    break;
                case 1:
                {
                    [weakSelf toPersonInfoWithModel:weakSelf.model editState:EditStatePersonNormalInfo];
                }
                    break;
                case 2:
                {
                    [weakSelf toPersonInfoWithModel:weakSelf.model editState:EditStatePersonBorrowOrLendMoney];
                }
                    break;
                default:
                    break;
            }
        };
        [self.view addSubview:_segmentView];
        [_segmentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
        UIView *line = [UIView new];
        line.backgroundColor = [UIColor lightGrayColor];
        [_segmentView addSubview:line];
        [line mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
            make.top.mas_equalTo(_segmentView.mas_top);
        }];
    }
    return _segmentView;
}

- (void)toDetail:(KK_InvestmenModel *)model {
    KK_PersonDetailViewController *vc = [KK_PersonDetailViewController new];
    vc.model = model;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toPersonInfoWithModel:(KK_InvestmenModel *)model editState:(EditState)ediState{
    
    __weak typeof(self) weakSelf = self;
    KK_PersonInformationViewController *vc = [KK_PersonInformationViewController new];
    vc.editState = ediState;
    NSDateFormatter *formater = [NSDateFormatter new];
    formater.dateFormat = @"yyyy-MM-dd- HH:mm";
    if (!model) {
        model = [KK_InvestmenModel new];
        model.investment_state = @(InvestmentStateNormal);
        model.ID = [formater stringFromDate:[NSDate date]];
        model.borrow_money_info = (RLMArray<KK_MoneyInfo> *)[[RLMArray alloc] initWithObjectClassName:NSStringFromClass([KK_MoneyInfo class])];
        if (__KKInvestmentManager.current_investment_type == InvestmentTypeBorrow) {
            KK_MoneyInfo *borrow = [KK_MoneyInfo new];
            borrow.number = @"0";
            borrow.investment_type = @(InvestmentTypeBorrow);
            borrow.date_info = [KK_DateInfo new];
            [model.borrow_money_info insertObject:borrow atIndex:0];
        }else {
            model.lend_money_info = (RLMArray<KK_MoneyInfo> *)[[RLMArray alloc] initWithObjectClassName:NSStringFromClass([KK_MoneyInfo class])];
            KK_MoneyInfo *lend = [KK_MoneyInfo new];
            lend.number = @"0";
            lend.investment_type = @(InvestmentTypeLend);
            lend.date_info = [KK_DateInfo new];
            [model.lend_money_info insertObject:[KK_MoneyInfo new] atIndex:0];
        }
        
    }else {
        model = [model copy];
        if (ediState == EditStatePersonBorrowOrLendMoney) {
            if (__KKInvestmentManager.current_investment_type == InvestmentTypeBorrow) {
                KK_MoneyInfo *borrow = [KK_MoneyInfo new];
                borrow.investment_type = @(InvestmentTypeBorrow);
                borrow.number = [NSString stringWithFormat:@"%zd", model.borrow_money_info.count];
                borrow.date_info = [KK_DateInfo new];
                [model.borrow_money_info insertObject:borrow atIndex:0];
            }else {
                KK_MoneyInfo *lend = [KK_MoneyInfo new];
                lend.number = [NSString stringWithFormat:@"%zd", model.lend_money_info.count];
                lend.investment_type = @(InvestmentTypeLend);
                lend.date_info = [KK_DateInfo new];
                [model.lend_money_info insertObject:[KK_MoneyInfo new] atIndex:0];
            }
        }
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
