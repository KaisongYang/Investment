//
//  KK_PersonInfoCell.h
//  Investment
//
//  Created by kk on 2018/3/4.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KK_PersonInfoCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, copy) ActionClick actionClick;
@property (nonatomic, strong) KK_InvestmenModel *model;
@end
