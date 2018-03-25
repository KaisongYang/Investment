//
//  KK_PersonDetailTableViewCell.m
//  Investment
//
//  Created by 杨开松 on 2018/3/10.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_PersonDetailTableViewCell.h"

@interface KK_PersonDetailTableViewCell()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *phone;
@property (nonatomic, strong) UILabel *address;
@property (nonatomic, strong) UILabel *ID;
@property (nonatomic, strong) UILabel *cardID;
@property (nonatomic, strong) UILabel *borrowMoneyTotal;
@property (nonatomic, strong) UILabel *borrowMoneyRateTotal;
@property (nonatomic, strong) UILabel *borrowMoneyTotalEnd;
@property (nonatomic, strong) UILabel *borrowMoneyRateTotalEnd;

@end

@implementation KK_PersonDetailTableViewCell

static NSString *identifier = @"KK_PersonDetailTableViewCell";
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    KK_PersonDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[KK_PersonDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
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

#define kDefaultStr         @"---------"
#define kTopMargin          10
#define kTitleColor         [UIColor blackColor]
#define kTitleFont          [UIFont systemFontOfSize:14]

- (void)setUI {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon"]];
        [self.contentView addSubview:_icon];
        _icon.layer.cornerRadius = 30.f;
        _icon.clipsToBounds = YES;
        [_icon mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(15);
            make.centerX.mas_equalTo(_icon.superview.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(60, 60));
        }];
    }
    
    if (!_name) {
        _name = [UILabel new];
        [self.contentView addSubview:_name];
        _name.text = @"张三";
        _name.font = [UIFont systemFontOfSize:18];
        _name.textColor = kTitleColor;
        [_name mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_icon.mas_centerX);
            make.top.mas_equalTo(_icon.mas_bottom).offset(5);
        }];
    }
    if (!_phone) {
        _phone = [UILabel new];
        [self.contentView addSubview:_phone];
        _phone.text = @"13588888888";
        _phone.font = kTitleFont;
        _phone.textColor = kTitleColor;
        [_phone mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_name.mas_bottom).offset(5);
            make.centerX.mas_equalTo(_name.mas_centerX);
        }];
    }
    if (!_address) {
        _address = [UILabel new];
        [self.contentView addSubview:_address];
        _address.font = kTitleFont;
        _address.textColor = kTitleColor;
        _address.text = @"北京市朝阳区望京街望京西路";
        _address.numberOfLines = 2;
        [_address mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(100);
            make.top.mas_equalTo(_phone.mas_bottom).offset(kTopMargin);
            make.right.mas_equalTo(-15);
        }];
        UILabel *left = [UILabel new];
        [self.contentView addSubview:left];
        left.font = kTitleFont;
        left.textColor = kTitleColor;
        left.text = @"地址：";
        [left mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(_address.mas_top);
        }];
    }
    if (!_ID) {
        _ID = [UILabel new];
        [self.contentView addSubview:_ID];
        _ID.font = kTitleFont;
        _ID.textColor = kTitleColor;
        _ID.text = @"412312313131312313313";
        [_ID mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(_address);
            make.top.mas_equalTo(_address.mas_bottom).offset(kTopMargin);
        }];
        UILabel *left = [UILabel new];
        [self.contentView addSubview:left];
        left.font = kTitleFont;
        left.textColor = kTitleColor;
        left.text = @"身份证：";
        [left mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(_ID.mas_top);
        }];
    }
    if (!_cardID) {
        _cardID = [UILabel new];
        [self.contentView addSubview:_cardID];
        _cardID.font = kTitleFont;
        _cardID.textColor = kTitleColor;
        _cardID.text = @"21235321241313132";
        [_cardID mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(_ID);
            make.top.mas_equalTo(_ID.mas_bottom).offset(kTopMargin);
        }];
        UILabel *left = [UILabel new];
        [self.contentView addSubview:left];
        left.font = kTitleFont;
        left.textColor = kTitleColor;
        left.text = @"银行卡：";
        [left mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(_cardID.mas_top);
        }];
    }
    if (!_borrowMoneyTotal) {
        _borrowMoneyTotal = [UILabel new];
        [self.contentView addSubview:_borrowMoneyTotal];
        _borrowMoneyTotal.font = kTitleFont;
        _borrowMoneyTotal.textColor = kTitleColor;
        _borrowMoneyTotal.text = @"1000000";
        [_borrowMoneyTotal mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(_cardID);
            make.top.mas_equalTo(_cardID.mas_bottom).offset(kTopMargin);
        }];
        UILabel *left = [UILabel new];
        [self.contentView addSubview:left];
        left.font = kTitleFont;
        left.textColor = kTitleColor;
        left.text = @"借入(元)：";
        [left mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(_borrowMoneyTotal.mas_top);
        }];
    }
    if (!_borrowMoneyRateTotal) {
        _borrowMoneyRateTotal = [UILabel new];
        [self.contentView addSubview:_borrowMoneyRateTotal];
        _borrowMoneyRateTotal.font = kTitleFont;
        _borrowMoneyRateTotal.textColor = kTitleColor;
        _borrowMoneyRateTotal.text = @"100000";
        [_borrowMoneyRateTotal mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(_borrowMoneyTotal);
            make.top.mas_equalTo(_borrowMoneyTotal.mas_bottom).offset(kTopMargin);
        }];
        UILabel *left = [UILabel new];
        [self.contentView addSubview:left];
        left.font = kTitleFont;
        left.textColor = kTitleColor;
        left.text = @"利息(元)：";
        [left mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(_borrowMoneyRateTotal.mas_top);
        }];
    }
    
    if (!_borrowMoneyTotalEnd) {
        _borrowMoneyTotalEnd = [UILabel new];
        [self.contentView addSubview:_borrowMoneyTotalEnd];
        _borrowMoneyTotalEnd.font = kTitleFont;
        _borrowMoneyTotalEnd.textColor = _COLOR_RGB(0x585858);
        _borrowMoneyTotalEnd.text = @"100000";
        [_borrowMoneyTotalEnd mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(_borrowMoneyRateTotal);
            make.top.mas_equalTo(_borrowMoneyRateTotal.mas_bottom).offset(kTopMargin);
        }];
        UILabel *left = [UILabel new];
        [self.contentView addSubview:left];
        left.font = kTitleFont;
        left.textColor = _COLOR_RGB(0x585858);
        left.text = @"借入(元)：";
        [left mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(_borrowMoneyTotalEnd.mas_top);
        }];
    }
    if (!_borrowMoneyRateTotalEnd) {
        _borrowMoneyRateTotalEnd = [UILabel new];
        [self.contentView addSubview:_borrowMoneyRateTotalEnd];
        _borrowMoneyRateTotalEnd.font = kTitleFont;
        _borrowMoneyRateTotalEnd.textColor = _COLOR_RGB(0x585858);
        _borrowMoneyRateTotalEnd.text = @"20000";
        
        [_borrowMoneyRateTotalEnd mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(_borrowMoneyTotalEnd);
            make.top.mas_equalTo(_borrowMoneyTotalEnd.mas_bottom).offset(kTopMargin);
        }];
        UILabel *left = [UILabel new];
        [self.contentView addSubview:left];
        left.font = kTitleFont;
        left.textColor = _COLOR_RGB(0x585858);
        left.text = @"利息(元)：";
        [left mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(_borrowMoneyRateTotalEnd.mas_top);
        }];
    }
}

- (void)setModel:(KK_InvestmenModel *)model {
    if (![model isKindOfClass:[KK_InvestmenModel class]]) {
        return;
    }
    _model = model;
    
    if (model.id_info.id_icon_data.length) {
        self.icon.image = [UIImage imageWithData:model.id_info.id_icon_data];
    }else {
        self.icon.image = [UIImage imageNamed:@"icon"];
    }
    self.name.text = model.id_info.id_name.length ? model.id_info.id_name:kDefaultStr;
    self.phone.text = model.phone.length ? model.phone:kDefaultStr;
    self.address.text = model.id_info.id_address.length ?model.id_info.id_address:kDefaultStr;
    self.ID.text = model.id_info.id_number.length ?model.id_info.id_number:kDefaultStr;
    self.cardID.text = model.bank_card_info.card_number.length ?model.bank_card_info.card_number:kDefaultStr;
    CGFloat borrowTotalMoney = 0.f;
    CGFloat borrowTotalRateMoney = 0.f;
    CGFloat borrowTotalMoneyEnd = 0.f;
    CGFloat borrowTotalRateMoneyEnd = 0.f;
    CGFloat rate = 0.f;
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd"];
    for (KK_MoneyInfo *info in model.borrow_money_info) {
        if (info.settleMoney.length) {
            borrowTotalMoneyEnd += [info.money floatValue];
            borrowTotalRateMoneyEnd += [info.settleMoney floatValue];
        }else {
            borrowTotalMoney += [info.money floatValue];
            if ([info.money floatValue] < 0.1) {
                rate = 0.f;
            }
            if (!model.date_info.startDate) {
                rate = 0.f;
            }
            NSString *dateStr = [format stringFromDate:[NSDate date]];
            if ([model.investment_state intValue] != 0) {
                dateStr = model.date_info.endDateStr;
            }
            rate = [info.money floatValue] * [info.rate floatValue] * [__KK_InvestmentSetting dateTimeDifferenceWithStartTime:info.date_info.startDateStr endTime:dateStr] * 0.01 / 365;
            if (rate < 0) {
                rate = 0.f;
            }
            if (info.settleMoney.length) {
                borrowTotalRateMoney += [info.settleMoney floatValue];
            }else {
                borrowTotalRateMoney += rate;
            }
        }
    }
    self.borrowMoneyTotal.text = [NSString stringWithFormat:@"%.2f元", borrowTotalMoney];
    self.borrowMoneyRateTotal.text = [NSString stringWithFormat:@"%.2f元", borrowTotalRateMoney];
    
    NSString *str = [NSString stringWithFormat:@"%.2f元", borrowTotalMoneyEnd];
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attStr addAttributes:@{
                            NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle)
                            } range:NSMakeRange(0, str.length)];
    self.borrowMoneyTotalEnd.attributedText = attStr;
    
    str = [NSString stringWithFormat:@"%.2f元", borrowTotalRateMoneyEnd];
    attStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attStr addAttributes:@{
                            NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle)
                            } range:NSMakeRange(0, str.length)];
    self.borrowMoneyRateTotalEnd.attributedText = attStr;
}

+ (CGFloat)cellHeight; {
    return 320.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

@interface KK_PersonDetailBorrowAndLendCell()
@property (nonatomic, strong) UILabel *money;
@property (nonatomic, strong) UILabel *moneyState;
@property (nonatomic, strong) UILabel *start;
@property (nonatomic, strong) UILabel *end;
@property (nonatomic, strong) UILabel *rate;
@property (nonatomic, strong) UILabel *totalRateMoney;
@property (nonatomic, strong) KK_MoneyInfo *tempModel;
@property (nonatomic, strong) UILabel *investState;
@end
@implementation KK_PersonDetailBorrowAndLendCell

static NSString *identifier2 = @"KK_PersonDetailBorrowAndLendCell";
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    KK_PersonDetailBorrowAndLendCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[KK_PersonDetailBorrowAndLendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
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
    
    if (!_investState) {
        _investState = [UILabel new];
        [self.contentView addSubview:_investState];
        _investState.font = [UIFont systemFontOfSize:15];
        _investState.textColor = [UIColor blackColor];
        _investState.textAlignment = NSTextAlignmentLeft;
        _investState.numberOfLines = 0;
        [_investState mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.centerY.mas_equalTo(_investState.superview.mas_centerY);
            make.width.mas_equalTo(100);
        }];
    }
    
    if (!_money) {
        _money = [UILabel new];
        [self.contentView addSubview:_money];
        _money.font = [UIFont systemFontOfSize:15];
        _money.textColor = [UIColor blackColor];
        [_money mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(100);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(_investState.mas_left).offset(-15);
        }];
    }
    if (!_moneyState) {
        _moneyState = [UILabel new];
        [self.contentView addSubview:_moneyState];
        _moneyState.font = [UIFont systemFontOfSize:15];
        _moneyState.textColor = [UIColor blackColor];
        _moneyState.text = @"借入(元)：";
        [_moneyState mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(_money.mas_top);
        }];
    }
    if (!_rate) {
        _rate = [UILabel new];
        [self.contentView addSubview:_rate];
        _rate.font = [UIFont systemFontOfSize:15];
        _rate.textColor = [UIColor blackColor];
        [_rate mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(100);
            make.top.mas_equalTo(_money.mas_bottom).offset(10);
            make.right.mas_equalTo(-15);
        }];
        UILabel *lbl = [UILabel new];
        [self.contentView addSubview:lbl];
        lbl.font = [UIFont systemFontOfSize:15];
        lbl.textColor = [UIColor blackColor];
        lbl.text = @"费率(%)：";
        [lbl mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(_rate.mas_top);
        }];
    }
    if (!_totalRateMoney) {
        _totalRateMoney = [UILabel new];
        [self.contentView addSubview:_totalRateMoney];
        _totalRateMoney.font = [UIFont systemFontOfSize:15];
        _totalRateMoney.textColor = [UIColor blackColor];
        [_totalRateMoney mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(100);
            make.top.mas_equalTo(_rate.mas_bottom).offset(10);
            make.right.mas_equalTo(-15);
        }];
        UILabel *lbl = [UILabel new];
        [self.contentView addSubview:lbl];
        lbl.font = [UIFont systemFontOfSize:15];
        lbl.textColor = [UIColor blackColor];
        lbl.text = @"总利息(元)：";
        [lbl mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(_totalRateMoney.mas_top);
        }];
    }
    if (!_start) {
        _start = [UILabel new];
        [self.contentView addSubview:_start];
        _start.font = [UIFont systemFontOfSize:15];
        _start.textColor = [UIColor blackColor];
        [_start mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(100);
            make.top.mas_equalTo(_totalRateMoney.mas_bottom).offset(10);
            make.right.mas_equalTo(-15);
        }];
        UILabel *lbl = [UILabel new];
        [self.contentView addSubview:lbl];
        lbl.font = [UIFont systemFontOfSize:15];
        lbl.textColor = [UIColor blackColor];
        lbl.text = @"开始日期：";
        [lbl mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(_start.mas_top);
        }];
    }
    if (!_end) {
        _end = [UILabel new];
        [self.contentView addSubview:_end];
        _end.font = [UIFont systemFontOfSize:15];
        _end.textColor = [UIColor blackColor];
        [_end mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(100);
            make.top.mas_equalTo(_start.mas_bottom).offset(10);
            make.right.mas_equalTo(-15);
        }];
        UILabel *lbl = [UILabel new];
        [self.contentView addSubview:lbl];
        lbl.font = [UIFont systemFontOfSize:15];
        lbl.textColor = [UIColor blackColor];
        lbl.text = @"结束日期：";
        [lbl mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(_end.mas_top);
        }];
    }
}

- (void)setModel:(KK_MoneyInfo *)model {
    if (![model isKindOfClass:[KK_MoneyInfo class]]) {
        return;
    }
    _model = model;
    self.tempModel = [model copy];
    self.money.text = model.money.length ? [NSString stringWithFormat:@"%.2f元", [model.money floatValue]] : @"---";
    self.rate.text = model.rate.length ? [NSString stringWithFormat:@"%.2f%%", [model.rate floatValue]] : @"---";
    self.start.text = model.date_info.startDateStr ?: @"---";
    self.end.text = model.date_info.endDateStr ?: @"---";
    switch ([model.investment_type intValue]) {
        case InvestmentTypeBorrow:
            self.moneyState.text = @"借入(元)：";
            break;
        case InvestmentTypeLend:
            self.moneyState.text = @"借出(元)：";
            break;
        default:
            break;
    }
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr = [format stringFromDate:[NSDate date]];
    if ([model.investment_state intValue] != 0) {
        dateStr = model.date_info.endDateStr;
    }
    NSInteger day = [__KK_InvestmentSetting dateTimeDifferenceWithStartTime:model.date_info.startDateStr endTime:dateStr];
    if (day < 0) {
        day = 0;
    }
    CGFloat totalRateMoney = [model.money floatValue] * [model.rate floatValue] * day * 0.01/365.0;
    if (model.settleMoney.length) {
        totalRateMoney = [model.settleMoney floatValue];
    }
    self.totalRateMoney.text = [NSString stringWithFormat:@"%.2f元", totalRateMoney];
    switch ([model.investment_state intValue]) {
        case InvestmentStateNormal:
        {
            CGFloat m = day == 0 ? 0.f : [model.money floatValue] * [model.rate floatValue] * 0.01/365.0;
            NSString *str = [NSString stringWithFormat:@"昨日利息：\n%.2f元", m];
            self.investState.text = str;
        }
            break;
        case InvestmentStateSuspend:
            self.investState.text = @"状态：\n已暂停";
            break;
        case InvestmentStateTerminate:
            self.investState.text = @"状态：\n已结束";
            break;
        default:
            break;
    }
}

+ (CGFloat)cellHeight; {
    return 150.f;
}

@end
