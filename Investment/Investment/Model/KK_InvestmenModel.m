//
//  KK_InvestmenModel.m
//  Investment
//
//  Created by kk on 2018/2/27.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_InvestmenModel.h"

@implementation KK_InvestmenModel

- (id)copyWithZone:(NSZone *)zone {
    KK_InvestmenModel *model = [[[self class] allocWithZone:zone] init];
    model.ID = self.ID;
    model.id_info = [self.id_info copy];
    model.bank_card_info =  [self.bank_card_info copy];
    model.phone = self.phone;
    model.rate = self.rate;
    model.investment_type = self.investment_type;
    model.investment_state = self.investment_state;
    model.investment_relationship = self.investment_relationship;
    model.startData = self.startData;
    model.startDataStr = self.startDataStr;
    model.endData = self.endData;
    model.endDataStr = self.endDataStr;
    model.createData = self.createData;
    model.createDataStr = self.createDataStr;
    return model;
}

+ (NSString *)primaryKey {
    return @"ID";
}
+ (NSArray<NSString *> *)indexedProperties {
    return @[@"ID"];
}

@end
