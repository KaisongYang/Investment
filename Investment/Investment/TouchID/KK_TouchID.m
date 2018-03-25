//
//  KK_TouchID.m
//  TouchID
//
//  Created by 杨开松 on 2018/3/24.
//  Copyright © 2018年 杨开松. All rights reserved.
//

#import "KK_TouchID.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface KK_TouchID()<UITextFieldDelegate>
@property (nonatomic, strong) UIView *view;
@end


@implementation KK_TouchID

+ (instancetype)touchID; {
    static KK_TouchID *touch = nil;
    if (!touch)
    {
        static dispatch_once_t once = 0;
        dispatch_once(&once, ^{
            touch = [[self class] new];
            [touch show];
        });
    }else {
        [touch show];
    }
    return touch;
    
}

- (void)show {

    _main_thread_run([self addSelf]);
    [self checkTouchID];
}

- (UIView *)view {
    if (!_view) {
        _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _view.backgroundColor = [UIColor whiteColor];
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 250, 40)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.placeholder = @"请输入隐私密码";
        textField.delegate = self;
        textField.returnKeyType = UIReturnKeyDone;
        textField.keyboardType = UIKeyboardTypeASCIICapable;
        [textField becomeFirstResponder];
        textField.center = _view.center;
        [_view addSubview:textField];
    }
    return _view;
}

- (void)checkTouchID
{
    LAContext *context = [LAContext new];
    context.localizedFallbackTitle = @"忘记密码";
    NSError *error = nil;
    __weak typeof(self) weakSelf = self;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        NSLog(@"--- 支持设备指纹");
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"指纹解锁" reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                _main_thread_run([weakSelf.view removeFromSuperview]);
                NSLog(@"--- 解锁成功");
            }else {
                _main_thread_run([weakSelf addSelf]);
                NSLog(@"-- 解锁失败：%@", error.localizedDescription);
                switch (error.code) {
                    case LAErrorSystemCancel:
                        NSLog(@"--- 系统取消授权");
                        break;
                    case LAErrorUserCancel:
                        NSLog(@"--- 用户取消验证Touch ID");
                        break;
                    case LAErrorAuthenticationFailed:
                        NSLog(@"--- 授权失败");
                        break;
                    case LAErrorPasscodeNotSet:
                        NSLog(@"--- 用户没有设置TouchID");
                        break;
                    case kLAErrorTouchIDNotAvailable:
                        NSLog(@"--- 用户设备不支持TouchID");
                        break;
                    case kLAErrorTouchIDNotEnrolled:
                        NSLog(@"--- 用户没有设置手指指纹");
                        break;
                    case LAErrorUserFallback:
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            NSLog(@"--- 用户选择输入密码，切换主线程处理");
                        }];
                        break;
                    default:
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            NSLog(@"--- 其他异常情况，切换主线程处理");
                        }];
                        break;
                }
            }
        }];
    }else {
        NSLog(@"--- 当前设备不支持指纹识别");
        switch (error.code) {
            case kLAErrorTouchIDNotEnrolled:
                NSLog(@"--- Touch ID has not been enrolled");
                break;
            case LAErrorPasscodeNotSet:
                NSLog(@"--- Passcode has not been set");
                break;
            default:
                NSLog(@"--- Touch ID is not available");
                break;
        }
        NSLog(@"-- 解锁失败：%@", error.localizedDescription);
    }
}

- (void)addSelf {
    if (![[UIApplication sharedApplication].keyWindow.subviews containsObject:self.view]) {
        [[UIApplication sharedApplication].keyWindow addSubview:self.view];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField.text isEqualToString:@"102189"]) {
        if (self.view) {
            [self.view removeFromSuperview];
            self.view = nil;
        }
    }else {
        NSLog(@"密码错误");
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
