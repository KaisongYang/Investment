//
//  KK_BorrowAndLendInfoCell.m
//  Investment
//
//  Created by 杨开松 on 2018/3/17.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_BorrowAndLendInfoCell.h"

@interface KK_BorrowAndLendInfoCell()<UITextFieldDelegate>
@property (nonatomic, strong) UILabel *rate;
@property (nonatomic, strong) UITextField *rateTF;
@property (nonatomic, strong) UILabel *money;
@property (nonatomic, strong) UITextField *moneyTF;
@property (nonatomic, strong) KK_InvestmenModel *tempModel;
@end

static NSString *identifier = @"KK_BorrowAndLendInfoCell";
#define kBaseTag    2000
@implementation KK_BorrowAndLendInfoCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    KK_BorrowAndLendInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[KK_BorrowAndLendInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setUI {
    
    BOOL isBorrow = __KKInvestmentManager.current_investment_type == InvestmentTypeBorrow;
    
    if (!_rateTF) {
        _rateTF = [UITextField new];
        [self.contentView addSubview:_rateTF];
        NSString *placeholder = @"请输入借入费率xxx%";
        if (!isBorrow) {
            placeholder = @"请输入借出费率xxx%";
        }
        _rateTF.placeholder = placeholder;
        _rateTF.textColor = [UIColor blackColor];
        _rateTF.font = [UIFont systemFontOfSize:15];
        _rateTF.borderStyle = UITextBorderStyleRoundedRect;
        _rateTF.keyboardType = UIKeyboardTypeDecimalPad;
        _rateTF.delegate = self;
        _rateTF.tag = kBaseTag+1;
        [_rateTF mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(100);
            make.right.mas_equalTo(-80);
            make.height.mas_equalTo(40);
            make.top.mas_equalTo(10);
        }];
    }
    
    if (!_rate) {
        _rate = [UILabel new];
        [self.contentView addSubview:_rate];
        _rate.text = @"费率（%）：";
        _rate.font = [UIFont systemFontOfSize:14];
        _rate.textColor = [UIColor blackColor];
        [_rate mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.centerY.mas_equalTo(_rateTF.mas_centerY);
        }];
    }
    
    if (!_moneyTF) {
        _moneyTF = [UITextField new];
        [self.contentView addSubview:_moneyTF];
        _moneyTF.placeholder = @"请输入金额xxx元";
        _moneyTF.textColor = [UIColor blackColor];
        _moneyTF.font = [UIFont systemFontOfSize:15];
        _moneyTF.borderStyle = UITextBorderStyleRoundedRect;
        _moneyTF.keyboardType = UIKeyboardTypeDecimalPad;
        _moneyTF.delegate = self;
        _moneyTF.tag = kBaseTag+2;
        [_moneyTF mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_rateTF.mas_left);
            make.right.mas_equalTo(_rateTF.mas_right);
            make.height.mas_equalTo(_rateTF.mas_height);
            make.top.mas_equalTo(_rateTF.mas_bottom).offset(10);
        }];
    }
    
    if (!_money) {
        _money = [UILabel new];
        [self.contentView addSubview:_money];
        _money.text = @"金额（元）";
        _money.font = [UIFont systemFontOfSize:14];
        _money.textColor = [UIColor blackColor];
        [_money mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_rate.mas_left);
            make.centerY.mas_equalTo(_moneyTF.mas_centerY);
        }];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSString *text = textField.text ?:@"";
    switch (textField.tag) {
        case kBaseTag + 1:
        {
            if (__KKInvestmentManager.current_investment_type == InvestmentTypeBorrow) {
                [self.model.borrow_money_info[0] setRate:text];
            }else {
                [self.model.lend_money_info[0] setRate:text];
            }
        }
            break;
        case kBaseTag + 2:
        {
            if (__KKInvestmentManager.current_investment_type == InvestmentTypeBorrow) {
                [self.model.borrow_money_info[0] setMoney:text];
            }else {
                [self.model.lend_money_info[0] setMoney:text];
            }
        }
            break;
        default:
            break;
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"--%zd--%@", textField.tag, textField.text);
    return YES;
}

- (void)setModel:(KK_InvestmenModel *)model {
    if (![model isKindOfClass:[KK_InvestmenModel class]]) {
        return;
    }
    _model = model;
    self.tempModel = [model copy];
    if (__KKInvestmentManager.current_investment_type == InvestmentTypeBorrow) {
        self.rateTF.text = [self.model.borrow_money_info[0] rate] ?:@"";
        self.moneyTF.text = [self.model.borrow_money_info[0] money] ?:@"";
    }else {
        self.rateTF.text = [self.model.lend_money_info[0] rate] ?:@"";
        self.moneyTF.text = [self.model.lend_money_info[0] money] ?:@"";
    }
}

+ (CGFloat)cellHeight; {
    return 110.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
