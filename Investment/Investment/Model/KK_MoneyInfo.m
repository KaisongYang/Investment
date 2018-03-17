//
//  KK_MoneyInfo.m
//  Investment
//
//  Created by 杨开松 on 2018/3/10.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_MoneyInfo.h"

@implementation KK_MoneyInfo
- (id)copyWithZone:(NSZone *)zone {
    KK_MoneyInfo *info = [[[self class] allocWithZone:zone] init];
    info.number = self.number;
    info.investment_type = self.investment_type;
    info.investment_state = self.investment_state;
    info.money = self.money;
    info.rate = self.rate;
    info.date_info = [self.date_info copy];
    return info;
}
+ (NSString *)primaryKey {
    return @"number";
}
@end
