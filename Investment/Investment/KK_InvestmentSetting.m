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

@end

