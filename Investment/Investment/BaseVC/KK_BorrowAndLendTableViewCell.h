//
//  KK_BorrowAndLendTableViewCell.h
//  Investment
//
//  Created by kk on 2018/2/27.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KK_InvestmentSetting.h"
#import "KK_InvestmenModel.h"

@interface KK_BorrowAndLendTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (void)updateInfo:(KK_InvestmenModel *)model;

@end
