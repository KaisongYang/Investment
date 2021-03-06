//
//  KK_CardInfoCell.h
//  Investment
//
//  Created by 杨开松 on 2018/3/17.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KK_CardInfoCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, copy) ActionClick actionClick;
@property (nonatomic, strong) KK_InvestmenModel *model;
+ (CGFloat)cellHeight;
@end
