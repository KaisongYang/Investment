//
//  KK_InvestmentManager.h
//  Investment
//
//  Created by kk on 2018/2/27.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KK_InvestmenModel.h"
#import "KK_InvestmentSetting.h"

/**
 投资管理类
 */
@interface KK_InvestmentManager : NSObject

+ (instancetype)shareManager;

/**
 借入数据
 */
@property (nonatomic, strong) NSMutableArray *borrowArrM;

/**
 借出数据
 */
@property (nonatomic, strong) NSMutableArray *lendArrM;

/**
 历史完结数据
 */
@property (nonatomic, strong) NSMutableArray *historyArrM;


/**
 当前选择的投资类型
 */
@property (nonatomic, assign) InvestmentType current_investment_type;

/**
 当前选择的投资类型数据
 */
@property (nonatomic, strong) NSMutableArray *curent_investmnet_data;

/**
 编辑
 */
- (void)updateInvestmentModel:(KK_InvestmenModel *)model toState:(InvestmentState)state;

@end

#define __KKInvestmentManager   [KK_InvestmentManager shareManager]
