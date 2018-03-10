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

@class KK_InvestmentSetting;

@interface KK_InvestmenModel : RLMObject<NSCopying>

/**
 主键，数据库查询需要
 */
@property NSString *ID;
/**
 投资人信息
 */
@property KK_IDInfo *id_info;

/**
 银行卡信息
 */
@property KK_BankCardInfo *bank_card_info;

/**
 手机号
 */
@property NSString *phone;

/**
 费率
 */
@property NSString *rate;

/**
 投资类型
 1、借入
 2、借出
 3、历史
 */
@property NSNumber<RLMInt> *investment_type;

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

@property NSDate *startData;
@property NSString *startDataStr;
@property NSDate *endData;
@property NSString *endDataStr;
@property NSDate *createData;
@property NSString *createDataStr;

@end

RLM_ARRAY_TYPE(KK_InvestmenModel)
