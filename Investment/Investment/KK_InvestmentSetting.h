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
    InvestmentTypeBorrow = 0,        // 借入
    InvestmentTypeLend,              // 借出
    InvestmentTypeHistory,           // 历史（废弃）
};

typedef NS_ENUM(NSUInteger, InvestmentState) {
    InvestmentStateNormal = 0,          // 正常
    InvestmentStateSuspend,             // 暂停
    InvestmentStateTerminate,           // 终止
};

typedef NS_ENUM(NSUInteger, EditState) {
    EditStatePersonInitial = 0,             // 初始化（包含所有信息）
    EditStatePersonNormalInfo,              // 用户信息
    EditStatePersonBorrowOrLendMoney,       // 借贷金钱
};

typedef void(^ActionClick)(NSInteger index);
typedef void(^ActionPassPersonInfo)(KK_InvestmenModel *model, BOOL isStore);

@interface KK_InvestmentSetting : NSObject
+ (instancetype)shareInstance;

@property (nonatomic, assign) BOOL useTouchID;
@property (nonatomic, assign) NSInteger investment_index;
- (NSString *)openUDID;
- (NSString *)accountPath;
- (NSString *)cachePath;
- (NSString *)pathOfDocument:(NSString *)filePath;
- (NSString *)directoryOfDocument:(NSString *)filePath;
- (NSInteger)dateTimeDifferenceWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;
@end

#define __KK_InvestmentSetting   [KK_InvestmentSetting shareInstance]
#define KKRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0]
#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height



#define _COLOR_RGB(rgbValue) [UIColor colorWith\
Red     :(rgbValue & 0xFF0000)     / (float)0xFF0000 \
green   :(rgbValue & 0xFF00)       / (float)0xFF00 \
blue    :(rgbValue & 0xFF)         / (float)0xFF \
alpha   :1.0]

#define _COLOR_RGBA(rgbaValue) [UIColor colorWith\
Red     :(rgbaValue & 0xFF000000)  / (float)0xFF000000 \
green   :(rgbaValue & 0xFF0000)    / (float)0xFF0000 \
blue    :(rgbaValue & 0xFF00)      / (float)0xFF00 \
alpha   :(rgbaValue & 0xFF)        / (float)0xFF]

// 判断是否主线程
#define __is_main_thread                [NSThread isMainThread]
// 使block在主线程中运行
#define _main_thread_run(block)    if (__is_main_thread) {(block);} else {dispatch_async(dispatch_get_main_queue(), ^{(block);});}
// 安全运行block
#define _call_block(block, ...)     if (block) {block(__VA_ARGS__);}
