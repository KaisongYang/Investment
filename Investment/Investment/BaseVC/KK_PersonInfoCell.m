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
    UIDatePicker *picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, kScreenHeight-200, kScreenWidth, 200)];
    picker.calendar = [NSCalendar currentCalendar];
    picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    picker.datePickerMode = UIDatePickerModeDate;
    picker.tag = sender.tag + 100;
    [picker addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    [[UIApplication sharedApplication].keyWindow addSubview:picker];
    [self valueChange:picker];
}
- (void)valueChange:(UIDatePicker *)picker {
    
    NSDate *date = picker.date;
    NSDateFormatter *formater = [NSDateFormatter new];
    formater.dateFormat = @"yyyy年MM月dd日";
    NSString *str = [formater stringFromDate:date];
    if (picker.tag == self.startData.tag+100) {
        [self.startData setTitle:str forState:UIControlStateNormal];
        self.model.startData = str;
    }else if (picker.tag == self.endData.tag+100) {
        [self.endData setTitle:str forState:UIControlStateNormal];
        self.model.endData = str;
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {

    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"--%zd--%@", textField.tag, textField.text);
    return YES;
}

- (void)setModel:(KK_InvestmenModel *)model {
    _model = model;
    _nameTF.text = model.id_info.id_name;
    _phoneTF.text = model.phone;
    _addressTF.text = model.id_info.id_address;
    _rateTF.text = model.rate;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end