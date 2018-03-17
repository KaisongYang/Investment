//
//  KK_PersonDetailTableViewCell.m
//  Investment
//
//  Created by 杨开松 on 2018/3/10.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_PersonDetailTableViewCell.h"

@interface KK_PersonDetailTableViewCell()

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

- (void)setUI {
    
}

+ (CGFloat)cellHeight; {
    return 200.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

@interface KK_PersonDetailBorrowAndLendCell()
@property (nonatomic, strong) UILabel *money;
@property (nonatomic, strong) UILabel *start;
@property (nonatomic, strong) UILabel *end;
@property (nonatomic, strong) UILabel *rate;
@property (nonatomic, strong) KK_MoneyInfo *tempModel;
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
    
    if (!_money) {
        _money = [UILabel new];
        [self.contentView addSubview:_money];
        _money.font = [UIFont systemFontOfSize:15];
        _money.textColor = [UIColor blackColor];
        [_money mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(100);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-15);
        }];
        UILabel *lbl = [UILabel new];
        [self.contentView addSubview:lbl];
        lbl.font = [UIFont systemFontOfSize:15];
        lbl.textColor = [UIColor blackColor];
        lbl.text = @"借入(元)：";
        [lbl mas_remakeConstraints:^(MASConstraintMaker *make) {
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
    if (!_start) {
        _start = [UILabel new];
        [self.contentView addSubview:_start];
        _start.font = [UIFont systemFontOfSize:15];
        _start.textColor = [UIColor blackColor];
        [_start mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(100);
            make.top.mas_equalTo(_rate.mas_bottom).offset(10);
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
    _model = model;
    self.tempModel = [model copy];
    self.money.text = model.money.length ? [NSString stringWithFormat:@"%@ 元", model.money] : @"---";
    self.rate.text = model.rate.length ? [NSString stringWithFormat:@"%@ %%", model.rate] : @"---";
    self.start.text = model.date_info.startDataStr ?: @"---";
    self.end.text = model.date_info.endDataStr ?: @"---";
}

+ (CGFloat)cellHeight; {
    return 120.f;
}

@end
