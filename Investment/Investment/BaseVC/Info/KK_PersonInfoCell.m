//
//  KK_PersonInfoCell.m
//  Investment
//
//  Created by kk on 2018/3/4.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_PersonInfoCell.h"

@interface KK_PersonInfoCell()<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UIButton *contactBtn;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UITextField *nameTF;
@property (nonatomic, strong) UILabel *phone;
@property (nonatomic, strong) UITextField *phoneTF;
@property (nonatomic, strong) UILabel *address;
@property (nonatomic, strong) UITextField *addressTF;
@property (nonatomic, strong) UIButton *startData;
@property (nonatomic, strong) UIButton *endData;
@property (nonatomic, strong) KK_InvestmenModel *tempModel;
@end

static NSString *identifier = @"KK_BorrowAndLendTableViewCell";
#define kBaseTag    1000
@implementation KK_PersonInfoCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    KK_PersonInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[KK_PersonInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
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
    
    if (!_icon) {
        _icon = [UIImageView new];
        _icon.backgroundColor = KKRandomColor;
        [self.contentView addSubview:_icon];
        _icon.layer.cornerRadius = 30.f;
        _icon.clipsToBounds = YES;
        [_icon mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(15);
            make.size.mas_equalTo(CGSizeMake(60, 60));
        }];
    }
    if (!_name) {
        _name = [UILabel new];
        [self.contentView addSubview:_name];
        _name.text = @"姓名：";
        _name.font = [UIFont systemFontOfSize:14];
        _name.textColor = [UIColor blackColor];
        [_name mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_icon.mas_left);
            make.top.mas_equalTo(_icon.mas_bottom).offset(30);
        }];
    }
    
    if (!_nameTF) {
        _nameTF = [UITextField new];
        [self.contentView addSubview:_nameTF];
        _nameTF.placeholder = @"请输入姓名";
        _nameTF.textColor = [UIColor blackColor];
        _nameTF.font = [UIFont systemFontOfSize:15];
        _nameTF.borderStyle = UITextBorderStyleRoundedRect;
        _nameTF.tag = kBaseTag + 3;
        _nameTF.delegate = self;
        [_nameTF mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(100);
            make.right.mas_equalTo(-80);
            make.height.mas_equalTo(40);
            make.centerY.mas_equalTo(_name.mas_centerY);
        }];
    }
    if (!_contactBtn) {
        _contactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_contactBtn];
        _contactBtn.backgroundColor = [UIColor redColor];
        [_contactBtn addTarget:self action:@selector(contactSelected:) forControlEvents:UIControlEventTouchUpInside];
        [_contactBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_nameTF.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.left.mas_equalTo(_nameTF.mas_right).offset(5);
        }];
    }
    
    if (!_phone) {
        _phone = [UILabel new];
        [self.contentView addSubview:_phone];
        _phone.text = @"手机号：";
        _phone.font = [UIFont systemFontOfSize:14];
        _phone.textColor = [UIColor blackColor];
        [_phone mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_name.mas_left);
            make.top.mas_equalTo(_nameTF.mas_bottom).offset(25);
        }];
    }
    
    if (!_phoneTF) {
        _phoneTF = [UITextField new];
        [self.contentView addSubview:_phoneTF];
        _phoneTF.placeholder = @"请输入手机号";
        _phoneTF.textColor = [UIColor blackColor];
        _phoneTF.font = [UIFont systemFontOfSize:15];
        _phoneTF.borderStyle = UITextBorderStyleRoundedRect;
        _phoneTF.keyboardType = UIKeyboardTypeNumberPad;
        _phoneTF.tag = kBaseTag + 4;
        _phoneTF.delegate = self;
        [_phoneTF mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_nameTF.mas_left);
            make.centerY.mas_equalTo(_phone.mas_centerY);
            make.right.mas_equalTo(_nameTF.mas_right);
            make.height.mas_equalTo(_nameTF.mas_height);
        }];
    }
    
    if (!_address) {
        _address = [UILabel new];
        [self.contentView addSubview:_address];
        _address.font = [UIFont systemFontOfSize:14];
        _address.textColor = [UIColor blackColor];
        _address.text = @"联系地址：";
        [_address mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_icon.mas_left);
            make.top.mas_equalTo(_phoneTF.mas_bottom).offset(25);
        }];
    }
    if (!_addressTF) {
        _addressTF = [UITextField new];
        [self.contentView addSubview:_addressTF];
        _addressTF.placeholder = @"请输入联系地址";
        _addressTF.textColor = [UIColor blackColor];
        _addressTF.font = [UIFont systemFontOfSize:15];
        _addressTF.borderStyle = UITextBorderStyleRoundedRect;
        _addressTF.tag = kBaseTag + 5;
        _addressTF.delegate = self;
        [_addressTF mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_nameTF.mas_left);
            make.centerY.mas_equalTo(_address.mas_centerY);
            make.right.mas_equalTo(_nameTF.mas_right);
            make.height.mas_equalTo(_nameTF.mas_height);
        }];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSString *text = textField.text ?:@"";
    switch (textField.tag) {
        case kBaseTag + 3:
        {
            self.model.id_info.id_name = text;
        }
            break;
        case kBaseTag + 4:
        {
            self.model.phone = text;
        }
            break;
        case kBaseTag + 5:
        {
            self.model.id_info.id_address = text;
        }
            break;
        case kBaseTag + 6:
        {
            if (__KKInvestmentManager.current_investment_type == InvestmentTypeBorrow) {
                [self.model.borrow_money_info[0] setRate:text ?:@""];
            }else {
                [self.model.lend_money_info[0] setRate:text ?:@""];
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
    _nameTF.text = model.id_info.id_name;
    _phoneTF.text = model.phone;
    _addressTF.text = model.id_info.id_address;
    if (model.date_info.startDateStr.length) {
        [_startData setTitle:model.date_info.startDateStr forState:UIControlStateNormal];
    }
    if (model.date_info.endDateStr.length) {
        [_endData setTitle:model.date_info.endDateStr forState:UIControlStateNormal];
    }
}

- (void)contactSelected:(id)sender {
    if (self.actionClick) {
        self.actionClick(-1);
    }
}

+ (CGFloat)cellHeight; {
    return 250.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
