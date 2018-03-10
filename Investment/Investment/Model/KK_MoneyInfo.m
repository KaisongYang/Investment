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
    info.money = self.money;
    info.rate = self.rate;
    info.date_info = self.date_info;
    return info;
}
@end
