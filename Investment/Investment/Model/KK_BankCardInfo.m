//
//  KK_BankCardInfo.m
//  Investment
//
//  Created by kk on 2018/2/27.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_BankCardInfo.h"

@implementation KK_BankCardInfo

- (id)copyWithZone:(NSZone *)zone {
    KK_BankCardInfo *info = [[[self class] allocWithZone:zone] init];
    info.card_name = self.card_name;
    info.card_number = self.card_number;
    info.card_valid_from = self.card_valid_from;
    info.card_valid_thru = self.card_valid_thru;
    return info;
}

@end
