//
//  KK_DateInfo.m
//  Investment
//
//  Created by 杨开松 on 2018/3/10.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_DateInfo.h"

@implementation KK_DateInfo
- (id)copyWithZone:(NSZone *)zone {
    KK_DateInfo *info = [[[self class] allocWithZone:zone] init];
    info.startDate = self.startDate;
    info.startDateStr = self.startDateStr;
    info.endDate = self.endDate;
    info.endDateStr = self.endDateStr;
    return info;
}
@end
