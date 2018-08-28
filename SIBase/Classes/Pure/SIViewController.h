//
//  SIViewController.h
//  SuperId
//
//  Created by Ye Tao on 2017/3/27.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import <AFNetworking/AFNetworkReachabilityManager.h>
#import <SIDefine/SIGlobalMacro.h>
#import <SIUIKit/SIAlertView.h>
#import <SIUIKit/SIMessageBox.h>
#import <SIUIKit/SINavigationBar.h>
#import <UIKit/UIKit.h>

@protocol SIViewController <NSObject>

/**
 just pop `1` level back
 */
- (void)goBack;

/**
 backward `level` level back

 @param level 往前跳的级数
 */
- (void)backward:(NSUInteger)level;

- (void)loadData;

@end

@interface SIViewController : UIViewController <SIViewController>

@property (nonatomic, assign) BOOL reloadWhenAppear;

@property (nonatomic, assign) BOOL hideNavigationBarLine;

@property (nonatomic, assign) BOOL customNaviBar;

@property (nonatomic, readonly) SINavigationBar *naviBar;

#pragma mark - Reachability

- (void)reachabilityHandler:(AFNetworkReachabilityStatus)status;

#pragma mark - Network Activity

@property (nonatomic, assign) BOOL customNetworkActivity;

@property (nonatomic, copy) NSString *networkActivityHint;

#pragma mark - Collector

@property (nonatomic, copy) NSString *pageUri;

@end

@interface SIViewController (SIAlert)

/**
 style is `UIAlertControllerStyleActionSheet`
 
 @param message just message
 @param okButtonTitle title of OK button
 @param cancelButtonTitle title of Cancel button
 @param handler Only okButton receive this handler
 */
- (void)alert:(NSString *)message
        okButton:(NSString *)okButtonTitle
    cancelButton:(NSString *)cancelButtonTitle
         handler:(void (^)(SIAlertAction *action))handler;

- (void)alert:(NSString *)message
    okButtonArray:(NSArray *)okButtonTitleArray
     cancelButton:(NSString *)cancelButtonTitle
          handler:(void (^)(SIAlertAction *action))handler;

/**
 style is `UIAlertControllerStyleActionSheet`
 cancel button is `取消`

 @param message just message
 @param buttonTitle title of OK button
 @param handler Only okButton receive this handler
 */
- (void)alert:(NSString *)message
     okButton:(NSString *)buttonTitle
      handler:(void (^)(SIAlertAction *action))handler;

- (void)alertArray:(NSMutableArray<NSString *> *)messageArray
          okButton:(NSString *)buttonTitle
           handler:(void (^)(SIAlertAction *action))handler;

- (void)showMessage:(NSString *)message;

- (void)showMessage:(NSString *)message title:(NSString *)title;

- (void)showError:(NSString *)error;

- (void)showWaiting:(NSString *)hint;

- (void)hideWaiting;

@end

@interface SIViewController (SINavi)

- (UIBarButtonItem *)barItemWithTitle:(NSString *)title selector:(SEL)selector;

- (UIBarButtonItem *)barItemWithIcon:(NSString *)icon selector:(SEL)selector;

@end
