//
//  KK_SegmentView.m
//  Investment
//
//  Created by kk on 2018/2/28.
//  Copyright © 2018年 KaisongYang. All rights reserved.
//

#import "KK_SegmentView.h"

@interface KK_SegmentView()

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *images;

@end

@implementation KK_SegmentView

- (instancetype)initWithTitles:(NSArray *)titles images:(NSArray *)images; {
    if (self = [super init]) {
        self.titles = [NSArray arrayWithArray:titles];
        self.images = [NSArray arrayWithArray:images];
        [self setUI];
    }
    return self;
}

- (void)setUI {
    
    NSInteger count = self.titles.count > self.images.count ? self.titles.count : self.images.count;
    
    for (int i = 0; i < count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = 1000 + i;
        [self addSubview:btn];
        if (self.titles.count >= i + 1) {
            [btn setTitle:self.titles[i] forState:UIControlStateNormal];
        }
        if (self.images.count >= i + 1) {
            [btn setImage:[UIImage imageNamed:self.images[i]] forState:UIControlStateNormal];
        }
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(actionClicked:) forControlEvents:UIControlEventTouchUpInside];
        [btn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width/count);
            if (i != 0) {
                make.left.mas_equalTo([self viewWithTag:1000+i-1].mas_right);
            }else {
                make.left.mas_equalTo(0);
            }
        }];
        if (i != count - 1) {
            UIView *line = [UIView new];
            line.backgroundColor = [UIColor lightGrayColor];
            [self addSubview:line];
            [line mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(btn.mas_right);
                make.centerY.mas_equalTo(self.mas_centerY);
                make.size.mas_equalTo(CGSizeMake(1, 25));
            }];
        }
        
    }
}

- (void)actionClicked:(UIButton *)sender {
    
    if (self.actionClick) {
        self.actionClick(sender.tag-1000);
    }
    NSLog(@"---%s----%@-----%zd", __FUNCTION__, sender.currentTitle, sender.tag-1000);
}

@end
