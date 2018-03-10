///Users/kk/Desktop/Investment/Investment/Investment/Model/KK_BankCardInfo.h
//  KK_BankCardInfo.h
//  Investment
//
//  Created by kk on 2018/2/27.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 银行卡信息
 */
@interface KK_BankCardInfo : RLMObject<NSCopying>

/**
 银行名称
 */
@property NSString *card_name;

/**
 银行卡号
 */
@property NSString *card_number;

/**
 银行卡有效期
 from xxx thru xxx
 */
@property NSString *card_valid_from;
@property NSString *card_valid_thru;

@end

RLM_ARRAY_TYPE(KK_BankCardInfo)
