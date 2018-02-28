//
//  KK_BorrowAndLendTableViewCell.m
//  Investment
//
//  Created by kk on 2018/2/27.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_BorrowAndLendTableViewCell.h"

@interface KK_BorrowAndLendTableViewCell()

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *phone;
@property (nonatomic, strong) UILabel *account;

@property (nonatomic, strong) UILabel *rate;

@end

static NSString *identifier = @"KK_BorrowAndLendTableViewCell";
@implementation KK_BorrowAndLendTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    KK_BorrowAndLendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[KK_BorrowAndLendTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
        self.backgroundColor = KKRandomColor;
    }
    return self;
}

- (void)setUI {
    
    if (!_icon) {
        _icon = [UIImageView new];
        _icon.backgroundColor = KKRandomColor;
        [self.contentView addSubview:_icon];
    }
    if (!_name) {
        _name = [UILabel new];
        [self.contentView addSubview:_name];
        _name.text = @"张三";
        _name.font = [UIFont systemFontOfSize:18];
        _name.textColor = [UIColor blackColor];
    }
    if (!_phone) {
        _phone = [UILabel new];
        [self.contentView addSubview:_phone];
        _phone.text = @"13588888888";
        _phone.font = [UIFont systemFontOfSize:14];
        _phone.textColor = [UIColor grayColor];
    }
    if (!_account) {
        _account = [UILabel new];
        [self.contentView addSubview:_account];
        _account.font = [UIFont systemFontOfSize:14];
        _account.textColor = [UIColor grayColor];
    }
    if (!_rate) {
        _rate = [UILabel new];
        [self.contentView addSubview:_rate];
        _rate.text = @"10%";
        _rate.font = [UIFont systemFontOfSize:30];
        _rate.textColor = [UIColor blackColor];
    }
}

- (void)updateInfo:(KK_InvestmenModel *)model {
    
}

@end
