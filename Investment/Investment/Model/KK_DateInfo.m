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
    info.startData = self.startData;
    info.startDataStr = self.startDataStr;
    info.endData = self.endData;
    info.endDataStr = self.endDataStr;
    info.editedDataArrM = [[RLMArray alloc] initWithObjectClassName:NSStringFromClass([NSDate class])];
    for (NSDate *date in self.editedDataArrM) {
        [info.editedDataArrM addObject:date];
    }
    return info;
}
@end
