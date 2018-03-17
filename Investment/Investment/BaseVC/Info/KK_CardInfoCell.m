//
//  KK_CardInfoCell.m
//  Investment
//
//  Created by 杨开松 on 2018/3/17.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_CardInfoCell.h"

@interface KK_CardInfoCell()<UITextFieldDelegate>
@property (nonatomic, strong) UILabel *cardID;
@property (nonatomic, strong) UITextField *cardIDTF;
@property (nonatomic, strong) KK_InvestmenModel *tempModel;
@end

@implementation KK_CardInfoCell

static NSString *identifier = @"KK_CardInfoCell";
#define kBaseTag    4000
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    KK_CardInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[KK_CardInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
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
    
    if (!_cardIDTF) {
        _cardIDTF = [UITextField new];
        [self.contentView addSubview:_cardIDTF];
        _cardIDTF.placeholder = @"请输入银行卡号";
        _cardIDTF.textColor = [UIColor blackColor];
        _cardIDTF.font = [UIFont systemFontOfSize:15];
        _cardIDTF.borderStyle = UITextBorderStyleRoundedRect;
        _cardIDTF.keyboardType = UIKeyboardTypeNumberPad;
        _cardIDTF.delegate = self;
        _cardIDTF.tag = kBaseTag+1;
        [_cardIDTF mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(100);
            make.right.mas_equalTo(-80);
            make.height.mas_equalTo(40);
            make.top.mas_equalTo(10);
        }];
    }
    
    if (!_cardID) {
        _cardID = [UILabel new];
        [self.contentView addSubview:_cardID];
        _cardID.text = @"银行卡号码：";
        _cardID.font = [UIFont systemFontOfSize:14];
        _cardID.textColor = [UIColor blackColor];
        [_cardID mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.centerY.mas_equalTo(_cardIDTF.mas_centerY);
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
            self.model.bank_card_info.card_number = text;
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
    self.cardIDTF.text = model.bank_card_info.card_number ?:@"";
}

+ (CGFloat)cellHeight; {
    return 60.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
