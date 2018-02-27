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
@interface KK_BankCardInfo : NSObject

/**
 银行名称
 */
@property (nonatomic, strong) NSString *card_name;

/**
 银行卡号
 */
@property (nonatomic, strong) NSString *card_number;

/**
 银行卡有效期
 from xxx thru xxx
 */
@property (nonatomic, strong) NSString *card_valid_from;
@property (nonatomic, strong) NSString *card_valid_thru;

@end
