//
//  KK_SelectedDataCell.m
//  Investment
//
//  Created by 杨开松 on 2018/3/17.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_SelectedDataCell.h"

@interface KK_SelectedDataCell()

@property (nonatomic, strong) UIButton *startData;
@property (nonatomic, strong) UIButton *endData;
@property (nonatomic, strong) KK_InvestmenModel *tempModel;

@end

@implementation KK_SelectedDataCell

static NSString *identifier = @"KK_SelectedDataCell";
#define kBaseTag    5000
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    KK_SelectedDataCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[KK_SelectedDataCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
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
    
    if (!_startData) {
        _startData = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_startData];
        [_startData setTitle:@"请选择开始日期" forState:UIControlStateNormal];
        [_startData setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _startData.titleLabel.font = [UIFont systemFontOfSize:15];
        _startData.tag = kBaseTag + 1;
        _startData.layer.borderWidth = 0.5;
        _startData.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _startData.layer.cornerRadius = 10.f;
        _startData.clipsToBounds = YES;
        _startData.titleLabel.numberOfLines = 0;
        _startData.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_startData addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [_startData mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.centerY.mas_equalTo(_startData.superview.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(120, 40));
        }];
    }
    if (!_endData) {
        _endData = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_endData];
        [_endData setTitle:@"请选择结束日期" forState:UIControlStateNormal];
        [_endData setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _endData.titleLabel.font = [UIFont systemFontOfSize:15];
        _endData.tag = kBaseTag + 2;
        _endData.layer.borderWidth = 0.5;
        _endData.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _endData.layer.cornerRadius = 10.f;
        _endData.clipsToBounds = YES;
        _endData.titleLabel.numberOfLines = 0;
        _endData.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_endData addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [_endData mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_startData.mas_right).offset(5);
            make.centerY.mas_equalTo(_startData.mas_centerY);
            make.size.mas_equalTo(_startData);
        }];
    }
}

- (void)action:(UIButton *)sender {
    [self endEditing:YES];
    for (UIView *v in [UIApplication sharedApplication].keyWindow.subviews) {
        if ([v isKindOfClass:[UIDatePicker class]]) {
            [v removeFromSuperview];
            break;
        }
    }
    
    NSString *startStr = @"";
    NSString *endStr = @"";
    BOOL isBorrow = __KKInvestmentManager.current_investment_type == InvestmentTypeBorrow;
    if (isBorrow) {
        startStr = [self.model.borrow_money_info[__KK_InvestmentSetting.investment_index] date_info].startDateStr;
        endStr = [self.model.borrow_money_info[__KK_InvestmentSetting.investment_index] date_info].endDateStr;
    }else {
        startStr = [self.model.lend_money_info[__KK_InvestmentSetting.investment_index] date_info].startDateStr;
        endStr = [self.model.lend_money_info[__KK_InvestmentSetting.investment_index] date_info].endDateStr;
    }
    
    NSDate *startDate = [NSDate date];
    NSDate *endDate = [NSDate date];
    NSDateFormatter *formater = [NSDateFormatter new];
    formater.dateFormat = @"yyyy-MM-dd";
    if (startStr.length) {
        startDate = [formater dateFromString:startStr];
    }
    if (endStr.length) {
        endDate = [formater dateFromString:endStr];
    }
    
    NSDate *date = sender.tag == self.startData.tag ? startDate : endDate;
    __weak typeof(self) weakSelf = self;
    WSDatePickerView *picker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay scrollToDate:date CompleteBlock:^(NSDate *d) {
        
        NSString *str = [formater stringFromDate:d];
        if (sender.tag == weakSelf.startData.tag) {
            [weakSelf.startData setTitle:str forState:UIControlStateNormal];
            if (isBorrow) {
                [weakSelf.model.borrow_money_info[__KK_InvestmentSetting.investment_index] date_info].startDateStr = str;
                [weakSelf.model.borrow_money_info[__KK_InvestmentSetting.investment_index] date_info].startDate = d;
            }else {
                [weakSelf.model.lend_money_info[__KK_InvestmentSetting.investment_index] date_info].startDateStr = str;
                [weakSelf.model.lend_money_info[__KK_InvestmentSetting.investment_index] date_info].startDate = d;
            }
        }else if (sender.tag == weakSelf.endData.tag) {
            [weakSelf.endData setTitle:str forState:UIControlStateNormal];
            
            if (isBorrow) {
                [weakSelf.model.borrow_money_info[__KK_InvestmentSetting.investment_index] date_info].endDateStr = str;
                [weakSelf.model.borrow_money_info[__KK_InvestmentSetting.investment_index] date_info].endDate = d;
            }else {
                [weakSelf.model.lend_money_info[__KK_InvestmentSetting.investment_index] date_info].endDateStr = str;
                [weakSelf.model.lend_money_info[__KK_InvestmentSetting.investment_index] date_info].endDate = d;
            }
        }
    }];
    [picker show];
    
    if (sender.tag == self.startData.tag) {
        if (endStr.length) {
            picker.maxLimitDate = [formater dateFromString:endStr];
        }else {
            picker.maxLimitDate = [NSDate date];
        }
    }else {
        if (startStr.length) {
            picker.minLimitDate = [formater dateFromString:startStr];
        }
    }
}

- (void)setModel:(KK_InvestmenModel *)model {
    if (![model isKindOfClass:[KK_InvestmenModel class]]) {
        return;
    }
    _model = model;
    self.tempModel = [model copy];
    NSString *startDataStr = @"";
    NSString *endDataStr = @"";
    if (__KKInvestmentManager.current_investment_type == InvestmentTypeBorrow) {
        startDataStr = [model.borrow_money_info[__KK_InvestmentSetting.investment_index] date_info].startDateStr;
        endDataStr = [model.borrow_money_info[__KK_InvestmentSetting.investment_index] date_info].endDateStr;
    }else {
        startDataStr = [model.lend_money_info[__KK_InvestmentSetting.investment_index] date_info].startDateStr;
        endDataStr = [model.lend_money_info[__KK_InvestmentSetting.investment_index] date_info].endDateStr;
    }
    if (startDataStr.length) {
        [_startData setTitle:startDataStr forState:UIControlStateNormal];
    }
    if (endDataStr.length) {
        [_endData setTitle:endDataStr forState:UIControlStateNormal];
    }
}

+ (CGFloat)cellHeight; {
    return 60.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
