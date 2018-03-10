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
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UITextField *nameTF;
@property (nonatomic, strong) UILabel *phone;
@property (nonatomic, strong) UITextField *phoneTF;
@property (nonatomic, strong) UILabel *address;
@property (nonatomic, strong) UITextField *addressTF;
@property (nonatomic, strong) UILabel *rate;
@property (nonatomic, strong) UITextField *rateTF;
@property (nonatomic, strong) UITextField *idTF;
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
    
    if (!_startData) {
        _startData = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_startData];
        [_startData setTitle:@"请选择开始日期" forState:UIControlStateNormal];
        [_startData setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _startData.titleLabel.font = [UIFont systemFontOfSize:15];
        _startData.tag = kBaseTag + 1;
        [_startData addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [_startData mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-15);
            make.top.mas_equalTo(_icon.mas_top).offset(5);
            make.size.mas_equalTo(CGSizeMake(150, 20));
        }];
    }
    if (!_endData) {
        _endData = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_endData];
        [_endData setTitle:@"请选择结束日期" forState:UIControlStateNormal];
        [_endData setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _endData.titleLabel.font = [UIFont systemFontOfSize:15];
        _endData.tag = kBaseTag + 2;
        [_endData addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [_endData mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_startData.mas_right);
            make.top.mas_equalTo(_startData.mas_bottom).offset(10);
            make.size.mas_equalTo(_startData);
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
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(40);
            make.centerY.mas_equalTo(_name.mas_centerY);
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
    if (!_rate) {
        _rate = [UILabel new];
        [self.contentView addSubview:_rate];
        _rate.text = @"费率：";
        _rate.font = [UIFont systemFontOfSize:14];
        _rate.textColor = [UIColor blackColor];
        [_rate mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_address.mas_left);
            make.top.mas_equalTo(_addressTF.mas_bottom).offset(25);
        }];
    }
    if (!_rateTF) {
        _rateTF = [UITextField new];
        [self.contentView addSubview:_rateTF];
        _rateTF.placeholder = @"请输入目标费率xx%";
        _rateTF.textColor = [UIColor blackColor];
        _rateTF.font = [UIFont systemFontOfSize:15];
        _rateTF.borderStyle = UITextBorderStyleRoundedRect;
        _rateTF.keyboardType = UIKeyboardTypeDecimalPad;
        _rateTF.tag = kBaseTag + 6;
        _rateTF.delegate = self;
        [_rateTF mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_nameTF.mas_left);
            make.centerY.mas_equalTo(_rate.mas_centerY);
            make.right.mas_equalTo(_nameTF.mas_right);
            make.height.mas_equalTo(_nameTF.mas_height);
        }];
    }
}

- (void)action:(UIButton *)sender {
    
    for (UIView *v in [UIApplication sharedApplication].keyWindow.subviews) {
        if ([v isKindOfClass:[UIDatePicker class]]) {
            [v removeFromSuperview];
            break;
        }
    }
    
    NSString *startStr = self.model.date_info.startDataStr;
    NSString *endStr = self.model.date_info.endDataStr;

    NSDate *startDate = [NSDate date];
    NSDate *endDate = [NSDate date];
    NSDateFormatter *formater = [NSDateFormatter new];
    formater.dateFormat = @"yyyy-MM-dd- HH:mm";
    if (startStr.length) {
        startDate = [formater dateFromString:startStr];
    }
    if (endStr.length) {
        endDate = [formater dateFromString:endStr];
    }
    
    NSDate *date = sender.tag == self.startData.tag ? startDate : endDate;
    __weak typeof(self) weakSelf = self;
    WSDatePickerView *picker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDayHourMinute scrollToDate:date CompleteBlock:^(NSDate *d) {
        
        NSString *str = [formater stringFromDate:d];
        if (sender.tag == weakSelf.startData.tag) {
            [weakSelf.startData setTitle:str forState:UIControlStateNormal];
            weakSelf.model.date_info.startDataStr = str;
            weakSelf.model.date_info.startData = date;
        }else if (sender.tag == weakSelf.endData.tag) {
            [weakSelf.endData setTitle:str forState:UIControlStateNormal];
            weakSelf.model.date_info.endDataStr = str;
            weakSelf.model.date_info.endData = date;
        }
    }];
    [picker show];
    if (sender.tag == self.startData.tag) {
        if (self.model.date_info.endDataStr.length) {
            picker.maxLimitDate = [formater dateFromString:self.model.date_info.endDataStr];
        }
    }else {
        if (self.model.date_info.startDataStr.length) {
            picker.minLimitDate = [formater dateFromString:self.model.date_info.startDataStr];
        }
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
            if ([self.model.investment_type isEqual:@(InvestmentTypeBorrow)]) {
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
    _model = model;
    self.tempModel = [model copy];
    _nameTF.text = model.id_info.id_name;
    _phoneTF.text = model.phone;
    _addressTF.text = model.id_info.id_address;
    if ([model.investment_type isEqual:@(InvestmentTypeBorrow)]) {
        _rateTF.text = [self.model.borrow_money_info[0] rate] ?:@"";
    }else {
        _rateTF.text = [self.model.lend_money_info[0] rate] ?:@"";
    }
    if (model.date_info.startDataStr.length) {
        [_startData setTitle:model.date_info.startDataStr forState:UIControlStateNormal];
    }
    if (model.date_info.endDataStr.length) {
        [_endData setTitle:model.date_info.endDataStr forState:UIControlStateNormal];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
