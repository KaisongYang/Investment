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
    model.borrow_money_info = (RLMArray<KK_MoneyInfo> *)[[RLMArray alloc] initWithObjectClassName:NSStringFromClass([KK_MoneyInfo class])];
    for (KK_MoneyInfo *info in self.borrow_money_info) {
        [model.borrow_money_info addObject:[info copy]];
    }
    model.lend_money_info = (RLMArray<KK_MoneyInfo> *)[[RLMArray alloc] initWithObjectClassName:NSStringFromClass([KK_MoneyInfo class])];
    for (KK_MoneyInfo *info in self.lend_money_info) {
        [model.lend_money_info addObject:[info copy]];
    }
    model.investment_state = self.investment_state;
    model.investment_relationship = self.investment_relationship;
    
    return model;
}

+ (NSString *)primaryKey {
    return @"ID";
}

@end
