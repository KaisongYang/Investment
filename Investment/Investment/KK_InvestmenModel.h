//
//  KK_InvestmenModel.h
//  Investment
//
//  Created by kk on 2018/2/27.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KK_InvestmenModel : NSObject

/**
 头像
 */
@property (nonatomic, strong) NSString *icon;

/**
 姓名
 */
@property (nonatomic, strong) NSString *name;

/**
 手机号
 */
@property (nonatomic, strong) NSString *phone;

/**
 家庭地址
 */
@property (nonatomic, strong) NSString *address;

/**
 银行卡号
 */
@property (nonatomic, strong) NSString *account;

/**
 费率
 */
@property (nonatomic, strong) NSString *rate;

/**
 投资类型
 1、借入
 2、借出
 */
@property (nonatomic, assign) NSInteger investment_type;

/**
 投资状态
 1、正常
 2、暂停
 3、终止
 */
@property (nonatomic, assign) NSInteger investment_state;

@end
