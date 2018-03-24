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
 当前选择的投资类型
 */
@property (nonatomic, assign) InvestmentType current_investment_type;

/**
 当前选择的投资类型数据
 */
@property (nonatomic, strong) NSArray<KK_InvestmenModel> *curent_investmnet_data;

/**
 编辑
 */
- (void)updateInvestmentModel:(KK_InvestmenModel *)model toState:(InvestmentState)state;
- (BOOL)isModelExist:(KK_InvestmenModel *)model;
@end

#define __KKInvestmentManager [KK_InvestmentManager shareManager]
