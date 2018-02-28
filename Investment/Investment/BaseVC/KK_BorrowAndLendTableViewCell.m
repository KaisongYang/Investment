//
//  KK_BorrowAndLendTableViewCell.m
//  Investment
//
//  Created by kk on 2018/2/27.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_BorrowAndLendTableViewCell.h"
#import "KK_SegmentView.h"

@interface KK_BorrowAndLendTableViewCell()

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *phone;
@property (nonatomic, strong) UILabel *address;
@property (nonatomic, strong) UILabel *rate;
@property (nonatomic, strong) KK_SegmentView *segmentView;
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
        _name.text = @"张三";
        _name.font = [UIFont systemFontOfSize:18];
        _name.textColor = [UIColor blackColor];
        [_name mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_icon.mas_right).offset(10);
            make.top.mas_equalTo(_icon.mas_top).offset(5);
        }];
    }
    if (!_phone) {
        _phone = [UILabel new];
        [self.contentView addSubview:_phone];
        _phone.text = @"13588888888";
        _phone.font = [UIFont systemFontOfSize:14];
        _phone.textColor = [UIColor grayColor];
        [_phone mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_name.mas_left);
            make.top.mas_equalTo(_name.mas_bottom).offset(5);
        }];
    }
    if (!_address) {
        _address = [UILabel new];
        [self.contentView addSubview:_address];
        _address.font = [UIFont systemFontOfSize:14];
        _address.textColor = [UIColor grayColor];
        _address.text = @"北京市朝阳区望京街望京西路";
        [_address mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_icon.mas_left);
            make.top.mas_equalTo(_icon.mas_bottom).offset(5);
        }];
    }
    if (!_rate) {
        _rate = [UILabel new];
        [self.contentView addSubview:_rate];
        _rate.text = @"10%";
        _rate.font = [UIFont systemFontOfSize:30];
        _rate.textColor = [UIColor blackColor];
        [_rate mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.centerY.mas_equalTo(_icon.mas_centerY);
            make.width.mas_equalTo(80);
        }];
        
//        UIView *line = [UIView new];
//        [self.contentView addSubview:line];
//        line.backgroundColor = [UIColor lightGrayColor];
//        [line mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.bottom.mas_equalTo(0);
//            make.height.mas_equalTo(0.5);
//        }];
    }
    if (!_segmentView) {
        _segmentView = [[KK_SegmentView alloc] initWithTitles:@[@"电话", @"编辑", @"新增"] images:@[]];
        [self.contentView addSubview:_segmentView];
        [_segmentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
    }
}

- (void)updateInfo:(KK_InvestmenModel *)model {
 
    __weak typeof(self) weakSelf = self;
    self.segmentView.actionClick = ^(NSInteger index) {
        weakSelf.actionClick(index);
    };
}

@end
