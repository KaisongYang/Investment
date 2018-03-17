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
#import "KK_DateInfo.h"
#import "KK_MoneyInfo.h"

@class KK_InvestmentSetting;

@interface KK_InvestmenModel : RLMObject<NSCopying>

/**
 主键，数据库查询需要
 */
@property NSString *ID;
/**
 手机号
 */
@property NSString *phone;

/**
 投资人身份信息
 */
@property KK_IDInfo *id_info;

/**
 投资人银行卡信息
 */
@property KK_BankCardInfo *bank_card_info;

/**
 时间相关
 */
@property (readonly)KK_DateInfo *date_info;

/**
 借入资产信息
 */
@property RLMArray<KK_MoneyInfo> *borrow_money_info;
@property (readonly) NSNumber<RLMDouble> *total_borrow_money;
/**
 借出资产信息
 */
@property RLMArray<KK_MoneyInfo> *lend_money_info;
@property (readonly) NSNumber<RLMDouble> *total_lend_money;

/**
 投资状态
 1、正常
 2、暂停
 3、终止
 */
@property NSNumber<RLMInt> *investment_state;

/**
 投资关系（可以自定义）
 1、亲戚
 2、同学
 3、朋友
 4、其他
 */
@property NSNumber<RLMInt> *investment_relationship;

@end

RLM_ARRAY_TYPE(KK_InvestmenModel)
