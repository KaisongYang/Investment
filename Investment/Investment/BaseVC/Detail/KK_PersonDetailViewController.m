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
@property (nonatomic, strong) NSString *settleStr;
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
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return self.model.borrow_money_info.count;
            break;
        case 2:
            return self.model.lend_money_info.count;
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        KK_PersonDetailTableViewCell *cell = [KK_PersonDetailTableViewCell cellWithTableView:tableView];
        cell.model = self.model;
        return cell;
    }else {
        KK_PersonDetailBorrowAndLendCell *cell = [KK_PersonDetailBorrowAndLendCell cellWithTableView:tableView];
        if (indexPath.section == 1) {
            cell.model = self.model.borrow_money_info[indexPath.row];
        }else {
            cell.model = self.model.lend_money_info[indexPath.row];
        }
        return cell;
    }
}

#define kSectionHeaderHeight    50.f
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    if (section == 1 && self.model.borrow_money_info.count) {
        return [self sectionHeaderWithLeftTitle:@"借入数据" rightTitle:nil];
    }else if (section == 2 && self.model.lend_money_info.count) {
        return [self sectionHeaderWithLeftTitle:@"借出数据" rightTitle:nil];
    }
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 10.f)];
    v.backgroundColor = _COLOR_RGB(0xf9f9f9);
    return v;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1 && self.model.borrow_money_info.count) {
        return kSectionHeaderHeight;
    }else if (section == 2 && self.model.lend_money_info.count) {
        return kSectionHeaderHeight;
    }
    return 0.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10.f;
}

- (UIView *)sectionHeaderWithLeftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle; {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kSectionHeaderHeight)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *left = [UILabel new];
    left.text = leftTitle ?:@"";
    left.textColor = _COLOR_RGB(0x1b1b1b);
    left.font = [UIFont systemFontOfSize:17];
    [view addSubview:left];
    [left mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(15);
    }];
    UILabel *right = [UILabel new];
    right.text = rightTitle ?:@"";
    right.textColor = _COLOR_RGB(0x585858);
    right.font = [UIFont systemFontOfSize:13];
    right.textAlignment = NSTextAlignmentRight;
    [view addSubview:right];
    [right mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(-15);
    }];
    UIView *line = [UIView new];
    line.backgroundColor = _COLOR_RGB(0xf1f1f1);
    [view addSubview:line];
    [line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    return view;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return NO;
    }
    KK_MoneyInfo *model;
    if (indexPath.section == 1) {
        model = self.model.borrow_money_info[indexPath.row];
    }else {
        model = self.model.lend_money_info[indexPath.row];
    }
    if ([model.investment_state intValue] != 0) {
        return NO;
    }
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return nil;
    }
    __weak typeof(self) weakSelf = self;
    KK_MoneyInfo *model;
    if (indexPath.section == 1) {
        model = self.model.borrow_money_info[indexPath.row];
    }else {
        model = self.model.lend_money_info[indexPath.row];
    }
    if ([model.investment_state intValue] != 0) {
        return nil;
    }
    self.settleStr = nil;
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"结束" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否确定结束？" message:@"请输入结束需要支付的利息，否则会使用默认计算" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *a1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert addAction:a1];
        UIAlertAction *a2 = [UIAlertAction actionWithTitle:@"结束" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            CGFloat settle = [weakSelf getSettleMoney:model];
            if (self.settleStr.length) {
                settle = [self.settleStr floatValue];
            }
            RLMRealm *realm = [RLMRealm defaultRealm];
            [realm transactionWithBlock:^{
                if ([model.investment_state intValue] == 0) {
                    model.investment_state = @(2);
                    model.settleMoney = [NSString stringWithFormat:@"%.2f", settle];
                    model.date_info.endDate = [NSDate date];
                    NSDateFormatter *formater = [NSDateFormatter new];
                    formater.dateFormat = @"yyyy-MM-dd";
                    model.date_info.endDateStr = [formater stringFromDate:model.date_info.endDate];
                }
                [realm addOrUpdateObject:weakSelf.model];
            }];
            [weakSelf.tableView reloadData];
        }];
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = [NSString stringWithFormat:@"结算利息：%.2f", [weakSelf getSettleMoney:model]];
            textField.returnKeyType = UIReturnKeyDone;
            textField.keyboardType = UIKeyboardTypeDecimalPad;
            [[NSNotificationCenter defaultCenter] addObserver:weakSelf selector:@selector(alertTextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
        }];
        [alert addAction:a2];
        
        [weakSelf presentViewController:alert animated:YES completion:nil];
    }];
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"修改" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        __KK_InvestmentSetting.investment_index = indexPath.row;
        [weakSelf editInvestMoneyInfo:weakSelf.model indexPath:indexPath];
    }];
    return @[action2, action1];
}

- (void)alertTextFieldDidChange:(NSNotification *)note {
    UITextField *textField = note.object;
    if ([textField isKindOfClass:[UITextField class]]) {
        self.settleStr = textField.text;
    }
}

- (CGFloat)getSettleMoney:(KK_MoneyInfo *)model {
    
    CGFloat settle = 0.f;
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd"];
    if ([model.money floatValue] < 0.1) {
        settle = 0.f;
    }
    if (!model.date_info.startDate) {
        settle = 0.f;
    }
    
    NSString *dateStr = [format stringFromDate:[NSDate date]];
    settle = [model.money floatValue] * [model.rate floatValue] * [__KK_InvestmentSetting dateTimeDifferenceWithStartTime:model.date_info.startDateStr endTime:dateStr] * 0.01 / 365;
    if (settle < 0) {
        settle = 0.f;
    }
    return settle;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
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
        line.backgroundColor = _COLOR_RGB(0xf1f1f1);
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

- (void)editInvestMoneyInfo:(KK_InvestmenModel *)model indexPath:(NSIndexPath *)indexPath  {
    
    __weak typeof(self) weakSelf = self;
    KK_PersonInformationViewController *vc = [KK_PersonInformationViewController new];
    vc.editState = EditStatePersonBorrowOrLendMoney;
    model = [model copy];
    if (!model.id_info) {
        model.id_info = [KK_IDInfo new];
    }
    if (!model.bank_card_info) {
        model.bank_card_info = [KK_BankCardInfo new];
    }
    vc.model = model;
    vc.actionPassPersonInfo = ^(KK_InvestmenModel *model, BOOL isStore) {
        __KK_InvestmentSetting.investment_index = 0;
        if (isStore) {
            [__KKInvestmentManager updateInvestmentModel:model toState:InvestmentStateNormal];
            [weakSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
    };
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)toPersonInfoWithModel:(KK_InvestmenModel *)model editState:(EditState)ediState{
    
    __weak typeof(self) weakSelf = self;
    KK_PersonInformationViewController *vc = [KK_PersonInformationViewController new];
    vc.editState = ediState;
    NSDateFormatter *formater = [NSDateFormatter new];
    formater.dateFormat = @"yyyy-MM-dd";
    if (!model) {
        __KK_InvestmentSetting.investment_index = 0;
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
        __KK_InvestmentSetting.investment_index = 0;
        if (isStore) {
            [__KKInvestmentManager updateInvestmentModel:model toState:InvestmentStateNormal];
            NSInteger section = 0;
            switch (ediState) {
                case EditStatePersonNormalInfo:
                    break;
                case EditStatePersonBorrowOrLendMoney:
                    section = 1;
                    break;
                default:
                    break;
            }
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
