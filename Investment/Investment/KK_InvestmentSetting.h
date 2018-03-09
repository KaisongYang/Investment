//
//  KK_InvestmentSetting.h
//  Investment
//
//  Created by kk on 2018/2/27.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KK_InvestmenModel;

typedef NS_ENUM(NSUInteger, InvestmentType) {
    InvestmentTypeBorrow = 1,        // 借入
    InvestmentTypeLend,              // 借出
    InvestmentTypeHistory,           // 历史
};

typedef NS_ENUM(NSUInteger, InvestmentState) {
    InvestmentStateNormal = 1,      // 正常
    InvestmentStateSuspend,         // 暂停
    InvestmentStateTerminate,       // 终止
};

typedef void(^ActionClick)(NSInteger index);

typedef void(^ActionPassPersonInfo)(KK_InvestmenModel *model);

@interface KK_InvestmentSetting : NSObject

@end

#define KKRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0]
#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height
