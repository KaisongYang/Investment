//
//  KK_SegmentView.h
//  Investment
//
//  Created by kk on 2018/2/28.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KK_SegmentView : UIView

@property (nonatomic, copy) ActionClick actionClick;

- (instancetype)initWithTitles:(NSArray *)titles images:(NSArray *)images;

@end
