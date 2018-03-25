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
@interface KK_IDInfo : RLMObject<NSCopying>

/**
 头像
 */
@property NSData *id_icon_data;

/**
 姓名
 */
@property NSString *id_name;

/**
 性别
 */
@property NSString *id_sex;

/**
 名族
 */
@property NSString *id_nation;

/**
 出生日期
 */
@property NSDate *id_born_date;
@property NSString *id_born_dateStr;

/**
 住址
 */
@property NSString *id_address;

/**
 身份证号码
 */
@property NSString *id_number;

/**
 签发机关
 */
@property NSString *id_issue_government;

/**
 有效期限
 */
@property NSString *id_valid_from;
@property NSString *id_valid_thru;

@end

RLM_ARRAY_TYPE(KK_IDInfo)
