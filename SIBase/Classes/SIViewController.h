//
//  SIViewController.h
//  SuperId
//
//  Created by Ye Tao on 2017/3/27.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import <AFNetworking/AFNetworkReachabilityManager.h>
#import <SIDefine/SIGlobalMacro.h>
#import <SIRequestCenter/SIRequestCenter.h>
#import <SIRequestKit/SIAffairInfo.h>
#import <SITheme/SIColor.h>
#import <SITheme/SIFont.h>
#import <SIUIKit/SIAlertView.h>
#import <SIUIKit/SIEmptyView.h>
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

#pragma mark - Reload

@property (nonatomic, assign) BOOL reloadWhenAppear;

@property (nonatomic, assign) BOOL reloadOnce;

@property (nonatomic, assign) BOOL noReloadOnce;

#pragma mark - NavigationBar

@property (nonatomic, assign) BOOL hideNavigationBarLine;

@property (nonatomic, assign) BOOL customNaviBar;

@property (nonatomic, assign) BOOL hideNavigationBar;

@property (nonatomic, readonly) SINavigationBar *naviBar;

#pragma mark - TabBar

@property (nonatomic, assign) BOOL alwaysShowTabBar;

#pragma mark - Appeared

@property (nonatomic, readonly) BOOL si_viewAppeared;

@property (nonatomic, assign) BOOL killWhenPushed;

#pragma mark - affair

@property (nonatomic, strong) SIAffairInfo *affair;

#pragma mark - Reachability

@property (nonatomic, assign) BOOL autoShowNetworkActivity;

- (void)reachabilityHandler:(AFNetworkReachabilityStatus)status;

#pragma mark - Collector

@property (nonatomic, copy) NSString *pageUri;

@property (nonatomic, assign) BOOL showExtraFooter;

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

- (void)showInfo:(NSString *)info;

- (void)showWaiting:(NSString *)hint;

- (void)hideWaiting;

@end

@interface SIViewController (SINavi)

- (UIBarButtonItem *)barItemWithTitle:(NSString *)title selector:(SEL)selector;

- (UIBarButtonItem *)barItemWithIcon:(NSString *)icon selector:(SEL)selector;

@end
