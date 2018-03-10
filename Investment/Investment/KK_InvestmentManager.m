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
        [mgr setUp];
    });
    return mgr;
}

- (void)setUp {
    self.current_investment_type = InvestmentTypeBorrow;
    [self createDataBaseWithName:[NSString stringWithFormat:@"kk_borrow_lend_%@", [OpenUDID value]]];
}

- (void)updateInvestmentModel:(KK_InvestmenModel *)model toState:(InvestmentState)state; {
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        model.investment_state = @(state);
        [realm addOrUpdateObject:model];
    }];
}

- (void)createDataBaseWithName:(NSString *)databaseName {
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [docPath stringByAppendingPathComponent:databaseName];
    NSLog(@"数据库：-- %@", filePath);
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.fileURL = [NSURL URLWithString:filePath];
    config.readOnly = NO;
    config.schemaVersion = 1.0;
    config.migrationBlock = ^(RLMMigration * _Nonnull migration, uint64_t oldSchemaVersion) {
        
    };
    [RLMRealmConfiguration setDefaultConfiguration:config];
}

#pragma mark -- setting && getting
- (RLMArray *)curent_investmnet_data {
    switch (self.current_investment_type) {
        case InvestmentTypeBorrow:
            return (RLMArray *)[KK_InvestmenModel objectsWhere:@"investment_type = 0"];
            break;
        case InvestmentTypeLend:
            return (RLMArray *)[KK_InvestmenModel objectsWhere:@"investment_type = 1"];
            break;
        case InvestmentTypeHistory:
            return (RLMArray *)[KK_InvestmenModel objectsWhere:@"investment_type = 2"];
            break;
        default:
            break;
    }
    return nil;
}
@end
