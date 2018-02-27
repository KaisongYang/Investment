//
//  KK_IDInfo.h
//  Investment
//
//  Created by kk on 2018/2/27.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 身份证信息
 */
@interface KK_IDInfo : NSObject

/**
 头像
 */
@property (nonatomic, strong) NSString *id_icon;

/**
 姓名
 */
@property (nonatomic, strong) NSString *id_name;

/**
 性别
 */
@property (nonatomic, strong) NSString *id_sex;

/**
 名族
 */
@property (nonatomic, strong) NSString *id_nation;

/**
 出生日期
 */
@property (nonatomic, strong) NSString *id_born_date;

/**
 住址
 */
@property (nonatomic, strong) NSString *id_address;

/**
 身份证号码
 */
@property (nonatomic, strong) NSString *id_number;

/**
 签发机关
 */
@property (nonatomic, strong) NSString *id_issue_government;

/**
 有效期限
 */
@property (nonatomic, strong) NSString *id_valid;


@end
