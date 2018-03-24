//
//  KK_InvestmentSetting.m
//  Investment
//
//  Created by kk on 2018/2/27.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_InvestmentSetting.h"
#import <OpenUDID.h>

@implementation KK_InvestmentSetting

NSString *gs_pathOfDocument = nil;

static KK_InvestmentSetting *setting = nil;
+ (instancetype)shareInstance {
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        setting = [[self alloc] init];
    });
    return setting;
}

- (NSString *)pathOfDocument:(NSString *)filePath {
    if (gs_pathOfDocument == nil)
    {
        gs_pathOfDocument = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:gs_pathOfDocument])
        {
            [[NSFileManager defaultManager] createDirectoryAtPath:gs_pathOfDocument withIntermediateDirectories:YES attributes:nil error:NULL];
        }
    }
    return ([gs_pathOfDocument stringByAppendingPathComponent:filePath]);
}

- (NSString *)directoryOfDocument:(NSString *)filePath {
    
    if (gs_pathOfDocument == nil)
    {
        gs_pathOfDocument = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:gs_pathOfDocument])
        {
            [[NSFileManager defaultManager] createDirectoryAtPath:gs_pathOfDocument withIntermediateDirectories:YES attributes:nil error:NULL];
        }
    }
    NSString *dirctoryName = [gs_pathOfDocument stringByAppendingPathComponent:filePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:dirctoryName]) {
        [[NSFileManager defaultManager]createDirectoryAtPath:dirctoryName withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    return dirctoryName;
}
- (NSString *)openUDID {
    return [OpenUDID value];
}
- (NSString *)accountPath {
    return [NSString stringWithFormat:@"/account/account_%@.local", [self openUDID]];
}
- (NSString *)cachePath {
    return [NSString stringWithFormat:@"/cache_%@.db", [self openUDID]];
}
/**
 
 * 开始到结束的时间差
 
 */
- (NSInteger)dateTimeDifferenceWithStartTime:(NSDate *)startTime endTime:(NSDate *)endTime{
    
    //    NSDateFormatter *date = [[NSDateFormatter alloc]init];
    //
    //    [date setDateFormat:@"yyyy-MM-dd"];
    //
    //    NSDate *startD =[date dateFromString:startTime];
    //
    //    NSDate *endD = [date dateFromString:endTime];
    
    NSTimeInterval start = [startTime timeIntervalSince1970]*1;
    
    NSTimeInterval end = [endTime timeIntervalSince1970]*1;
    
    NSTimeInterval value = end - start;
    
    //    int second = (int)value %60;//秒
    //
    //    int minute = (int)value /60%60;
    //
    //    int house = (int)value / (24 *3600)%3600;
    
    int day = (int)value / (24 *3600);
    
    return day;
    //    NSString *str;
    //    if (day != 0) {
    //
    //        str = [NSString stringWithFormat:@"耗时%d天%d小时%d分%d秒",day,house,minute,second];
    //
    //    }else if (day==0 && house !=0) {
    //
    //        str = [NSString stringWithFormat:@"耗时%d小时%d分%d秒",house,minute,second];
    //
    //    }else if (day==0 && house==0 && minute!=0) {
    //
    //        str = [NSString stringWithFormat:@"耗时%d分%d秒",minute,second];
    //
    //    }else{
    //
    //        str = [NSString stringWithFormat:@"耗时%d秒",second];
    //
    //    }
    //
    //    return str;
    
}
@end

