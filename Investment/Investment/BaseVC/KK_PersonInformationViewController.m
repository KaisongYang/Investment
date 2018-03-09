//
//  KK_PersonInformationViewController.m
//  Investment
//
//  Created by kk on 2018/2/28.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_PersonInformationViewController.h"
#import "KK_PersonInfoCell.h"

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
    [addBtn setTitle:@"OK" forState:UIControlStateNormal];
    [addBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [addBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
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
    [btn setTitle:@"X" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [btn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(20);
        make.size.mas_equalTo(CGSizeMake(45, 45));
    }];
}
- (void)close:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)ok:(UIButton *)sender {
    
    __weak typeof(self) weakSelf = self;
    [self dismissViewControllerAnimated:YES completion:^{
        if (weakSelf.pasteConfiguration) {
            weakSelf.actionPassPersonInfo(weakSelf.model);
        }
    }];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    KK_PersonInfoCell *cell = [KK_PersonInfoCell cellWithTableView:tableView];
    cell.model = self.model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}

#pragma mark - setting & getting
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
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
