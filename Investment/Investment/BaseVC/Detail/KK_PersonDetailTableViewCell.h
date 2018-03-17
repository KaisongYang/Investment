//
//  KK_PersonDetailTableViewCell.h
//  Investment
//
//  Created by 杨开松 on 2018/3/10.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KK_PersonDetailTableViewCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, copy) ActionClick actionClick;
@property (nonatomic, strong) KK_InvestmenModel *model;
+ (CGFloat)cellHeight;
@end

@interface KK_PersonDetailBorrowAndLendCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, copy) ActionClick actionClick;
@property (nonatomic, strong) KK_MoneyInfo *model;
+ (CGFloat)cellHeight;
@end

