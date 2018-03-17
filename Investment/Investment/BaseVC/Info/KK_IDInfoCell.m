//
//  KK_IDInfoCell.m
//  Investment
//
//  Created by 杨开松 on 2018/3/17.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_IDInfoCell.h"

@interface KK_IDInfoCell()<UITextFieldDelegate>
@property (nonatomic, strong) UILabel *ID;
@property (nonatomic, strong) UITextField *idTF;
@property (nonatomic, strong) KK_InvestmenModel *tempModel;
@end

@implementation KK_IDInfoCell

static NSString *identifier = @"KK_IDInfoCell";
#define kBaseTag    3000
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    KK_IDInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[KK_IDInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
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
    
    if (!_idTF) {
        _idTF = [UITextField new];
        [self.contentView addSubview:_idTF];
        _idTF.placeholder = @"请输入身份证号码";
        _idTF.textColor = [UIColor blackColor];
        _idTF.font = [UIFont systemFontOfSize:15];
        _idTF.borderStyle = UITextBorderStyleRoundedRect;
//        _idTF.keyboardType = UIKeyboardTypeDecimalPad;
        _idTF.delegate = self;
        _idTF.tag = kBaseTag+1;
        [_idTF mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(100);
            make.right.mas_equalTo(-80);
            make.height.mas_equalTo(40);
            make.top.mas_equalTo(10);
        }];
    }
    
    if (!_ID) {
        _ID = [UILabel new];
        [self.contentView addSubview:_ID];
        _ID.text = @"身份证号码：";
        _ID.font = [UIFont systemFontOfSize:14];
        _ID.textColor = [UIColor blackColor];
        [_ID mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.centerY.mas_equalTo(_idTF.mas_centerY);
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
            self.model.id_info.id_number = text;
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
    self.idTF.text = model.id_info.id_number ?:@"";
}

+ (CGFloat)cellHeight; {
    return 60.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
