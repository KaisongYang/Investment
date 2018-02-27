//
//  KK_InvestmenModel.h
//  Investment
//
//  Created by kk on 2018/2/27.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KK_IDInfo.h"
#import "KK_BankCardInfo.h"

@interface KK_InvestmenModel : NSObject

/**
 投资人信息
 */
@property (nonatomic, strong) KK_IDInfo *id_info;

/**
 银行卡信息
 */
@property (nonatomic, strong) KK_BankCardInfo *bank_card_info;

/**
 手机号
 */
@property (nonatomic, strong) NSString *phone;

/**
 费率
 */
@property (nonatomic, strong) NSString *rate;

/**
 投资类型
 1、借入
 2、借出
 */
@property (nonatomic, assign) NSInteger investment_type;

/**
 投资状态
 1、正常
 2、暂停
 3、终止
 */
@property (nonatomic, assign) NSInteger investment_state;

@end
