//
//  KK_IDInfo.m
//  Investment
//
//  Created by kk on 2018/2/27.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_IDInfo.h"

@implementation KK_IDInfo

- (id)copyWithZone:(NSZone *)zone {
    KK_IDInfo *info = [[[self class] allocWithZone:zone] init];
    info.id_icon_data = self.id_icon_data;
    info.id_sex = self.id_sex;
    info.id_name = self.id_name;
    info.id_nation = self.id_nation;
    info.id_number = self.id_number;
    info.id_address =  self.id_address;
    info.id_born_date = self.id_born_date;
    info.id_born_dateStr = self.id_born_dateStr;
    info.id_valid_from = self.id_valid_from;
    info.id_valid_thru = self.id_valid_thru;
    info.id_issue_government = self.id_issue_government;
    return info;
}
@end
