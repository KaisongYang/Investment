//
//  KK_PersonInformationViewController.h
//  Investment
//
//  Created by kk on 2018/2/28.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KK_PersonInformationViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) EditState editState;
@property (nonatomic, strong) KK_InvestmenModel *model;
@property (nonatomic, copy) ActionPassPersonInfo actionPassPersonInfo;
@end
