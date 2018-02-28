//
//  KK_InvestmentManager.m
//  Investment
//
//  Created by kk on 2018/2/27.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_InvestmentManager.h"

@implementation KK_InvestmentManager

static KK_InvestmentManager *mgr = nil;
+ (instancetype)shareManager {
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        mgr = [[self alloc] init];
    });
    return mgr;
}

- (void)updateInvestmentModel:(KK_InvestmenModel *)model toState:(InvestmentState)state; {
    
    if (model.investment_state == state) {
        return;
    }
    switch (state) {
        case InvestmentStateNormal:
        {
            if (model.investment_type == InvestmentTypeBorrow) {
                [self.borrowArrM insertObject:model atIndex:0];
            }else {
                [self.lendArrM insertObject:model atIndex:0];
            }
            if (model.investment_state == InvestmentStateTerminate) {
                [self.historyArrM removeObject:model];
            }
        }
            break;
        case InvestmentStateSuspend:
        {
            
        }
            break;
        case InvestmentStateTerminate:
        {
            [self.historyArrM insertObject:model atIndex:0];
        }
            break;
        default:
            break;
    }
    model.investment_state = state;
}

#pragma mark -- setting && getting
- (NSMutableArray *)borrowArrM {
    if (!_borrowArrM) {
        _borrowArrM = [NSMutableArray arrayWithCapacity:1];
    }
    return _borrowArrM;
}
- (NSMutableArray *)lendArrM {
    if (!_lendArrM) {
        _lendArrM = [NSMutableArray arrayWithCapacity:1];
    }
    return _lendArrM;
}
- (NSMutableArray *)historyArrM {
    if (!_historyArrM) {
        _historyArrM = [NSMutableArray arrayWithCapacity:1];
    }
    return _historyArrM;
}
- (NSMutableArray *)curent_investmnet_data {
    if (!_curent_investmnet_data) {
        _curent_investmnet_data = [NSMutableArray arrayWithCapacity:1];
    }
    return _curent_investmnet_data;
}

- (void)setCurrent_investment_type:(InvestmentType)current_investment_type {
    if (_current_investment_type != current_investment_type) {
        _current_investment_type = current_investment_type;
        switch (current_investment_type) {
            case InvestmentTypeBorrow:
                self.curent_investmnet_data = [self.borrowArrM mutableCopy];
                break;
            case InvestmentTypeLend:
                self.curent_investmnet_data = [self.lendArrM mutableCopy];
                break;
            case InvestmentTypeHistory:
                self.curent_investmnet_data = [self.historyArrM mutableCopy];
                break;
            default:
                break;
        }
    }
    
}

@end
