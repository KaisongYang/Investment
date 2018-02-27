//
//  KK_BorrowAndLendBaseViewController.h
//  Investment
//
//  Created by kk on 2018/2/27.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KK_InvestmentSetting.h"

@interface KK_BorrowAndLendBaseViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end
