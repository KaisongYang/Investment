//
//  KK_DateInfo.h
//  Investment
//
//  Created by 杨开松 on 2018/3/10.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "RLMObject.h"

@interface KK_DateInfo : RLMObject<NSCopying>

@property NSDate *startData;
@property NSString *startDataStr;
@property NSDate *endData;
@property NSString *endDataStr;
@property RLMArray<NSDate *> *editedDataArrM;

@end
RLM_ARRAY_TYPE(KK_DateInfo)
