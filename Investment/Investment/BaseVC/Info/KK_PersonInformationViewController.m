//
//  KK_PersonInformationViewController.m
//  Investment
//
//  Created by kk on 2018/2/28.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_PersonInformationViewController.h"
#import "KK_PersonInfoCell.h"
#import "KK_BorrowAndLendInfoCell.h"
#import "KK_IDInfoCell.h"
#import "KK_CardInfoCell.h"
#import "KK_SelectedDataCell.h"
#import <LJContactManager.h>

@interface KK_PersonInformationViewController ()

@end

@implementation KK_PersonInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView reloadData];
    [self addCloseBtn];
    [self addOKbtn];
}

- (void)addOKbtn {
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:addBtn];
    addBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [addBtn setImage:[UIImage imageNamed:@"icCheck"] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(ok:) forControlEvents:UIControlEventTouchUpInside];
    [addBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.size.mas_equalTo(CGSizeMake(45, 45));
    }];
}


- (void)addCloseBtn {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    [btn setImage:[UIImage imageNamed:@"close-16"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [btn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(20);
        make.size.mas_equalTo(CGSizeMake(45, 45));
    }];
}
- (void)close:(UIButton *)sender {
    [self.view endEditing:YES];
    __weak typeof(self) weakSelf = self;
    [self dismissViewControllerAnimated:YES completion:^{
        if (weakSelf.actionPassPersonInfo) {
            weakSelf.actionPassPersonInfo(weakSelf.model, NO);
        }
    }];
}

- (void)ok:(UIButton *)sender {
    [self.view endEditing:YES];
    NSString *title = @"";
    if (self.model.id_info.id_name.length < 1 || self.model.phone.length < 1) {
        title = @"姓名与手机号属于必填项，请确认已经填写完毕";
    }else {
        int temp = 0;
        KK_MoneyInfo *info = self.model.borrow_money_info[0];
        if (info.money.length) {
            temp++;
        }
        if (info.rate.length) {
            temp++;
        }
        if (info.date_info.startDate) {
            temp++;
        }
        if (temp != 3 && temp != 0) {
            title = @"金额、利息和开始时间必须填写完整";
        }
    }
    if (title.length) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:title delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    __weak typeof(self) weakSelf = self;
    [self dismissViewControllerAnimated:YES completion:^{
        if (weakSelf.actionPassPersonInfo) {
            weakSelf.actionPassPersonInfo(weakSelf.model, YES);
        }
    }];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (self.editState) {
        case EditStatePersonInitial:
            return 5;
            break;
        case EditStatePersonNormalInfo:
            return 3;
            break;
        case EditStatePersonBorrowOrLendMoney:
            return 2;
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    __weak typeof(self) weakSelf = self;
    switch (indexPath.row) {
        case 0:
        {
            if (self.editState == EditStatePersonNormalInfo) {
                KK_PersonInfoCell *cell = [KK_PersonInfoCell cellWithTableView:tableView];
                cell.actionClick = ^(NSInteger index) {
                  [weakSelf openContactVC];
                };
                cell.model = self.model;
                return cell;
            }else {
                KK_SelectedDataCell *cell = [KK_SelectedDataCell cellWithTableView:tableView];
                cell.model = self.model;
                return cell;
            }
        }
            break;
        case 1:
        {
            switch (self.editState) {
                case EditStatePersonInitial:
                {
                    KK_PersonInfoCell *cell = [KK_PersonInfoCell cellWithTableView:tableView];
                    cell.actionClick = ^(NSInteger index) {
                        [weakSelf openContactVC];
                    };
                    cell.model = self.model;
                    return cell;
                }
                    break;
                case EditStatePersonNormalInfo:
                {
                    KK_IDInfoCell *cell = [KK_IDInfoCell cellWithTableView:tableView];
                    cell.model = self.model;
                    return cell;
                }
                    break;
                case EditStatePersonBorrowOrLendMoney:
                {
                    KK_BorrowAndLendInfoCell *cell = [KK_BorrowAndLendInfoCell cellWithTableView:tableView];
                    cell.model = self.model;
                    return cell;
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2:
        {
            switch (self.editState) {
                case EditStatePersonInitial:
                {
                    KK_IDInfoCell *cell = [KK_IDInfoCell cellWithTableView:tableView];
                    cell.model = self.model;
                    return cell;
                }
                    break;
                case EditStatePersonNormalInfo:
                {
                    KK_CardInfoCell *cell = [KK_CardInfoCell cellWithTableView:tableView];
                    cell.model = self.model;
                    return cell;
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 3:
        {
            switch (self.editState) {
                case EditStatePersonInitial:
                {
                    KK_CardInfoCell *cell = [KK_CardInfoCell cellWithTableView:tableView];
                    cell.model = self.model;
                    return cell;
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 4:
        {
            KK_BorrowAndLendInfoCell *cell = [KK_BorrowAndLendInfoCell cellWithTableView:tableView];
            cell.model = self.model;
            return cell;
        }
            break;
        default:
            break;
    }
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            if (self.editState == EditStatePersonNormalInfo) {
                return [KK_PersonInfoCell cellHeight];
            }else {
                return [KK_SelectedDataCell cellHeight];
            }
            break;
        }
        case 1:
        {
            switch (self.editState) {
                case EditStatePersonInitial:
                {
                    return [KK_PersonInfoCell cellHeight];
                }
                    break;
                case EditStatePersonNormalInfo:
                {
                    return [KK_IDInfoCell cellHeight];
                }
                    break;
                case EditStatePersonBorrowOrLendMoney:
                {
                    return [KK_BorrowAndLendInfoCell cellHeight];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2:
        {
            switch (self.editState) {
                case EditStatePersonInitial:
                {
                    return [KK_IDInfoCell cellHeight];
                }
                    break;
                case EditStatePersonNormalInfo:
                {
                    return [KK_CardInfoCell cellHeight];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 3:
            return [KK_CardInfoCell cellHeight];
            break;
        case 4:
            return [KK_BorrowAndLendInfoCell cellHeight];
        default:
            break;
    }
    return 0.01;
}

- (void)openContactVC {
    
    __weak typeof(self) weakSelf = self;
    [[LJContactManager sharedInstance] requestAddressBookAuthorization:^(BOOL authorization) {
        if (authorization) {
            [[LJContactManager sharedInstance] selectContactAtController:self complection:^(NSString *name, NSString *phone) {
                weakSelf.model.id_info.id_name = name ?:@"";
                weakSelf.model.phone = phone ?:@"";
                [weakSelf.tableView reloadData];
            }];
        }
    }];
}

#pragma mark - setting & getting
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(64);
        }];
    }
    return _tableView;
}

- (KK_InvestmenModel *)model {
    if (!_model) {
        _model = [KK_InvestmenModel new];
    }
    return _model;
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
