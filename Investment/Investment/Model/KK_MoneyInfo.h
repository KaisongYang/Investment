//
//  KK_MoneyInfo.h
//  Investment
//
//  Created by 杨开松 on 2018/3/10.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "RLMObject.h"
#import "KK_DateInfo.h"

@interface KK_MoneyInfo : RLMObject<NSCopying>

/**
 序号
 */
@property NSString *number;

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
 钱
 */
@property NSString *money;

/**
 费率
 */
@property NSString *rate;

/**
 此笔业务时间线
 */
@property KK_DateInfo *date_info;

@end
RLM_ARRAY_TYPE(KK_MoneyInfo)
