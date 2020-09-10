//
//  SIViewController.h
//  SuperId
//
//  Created by Ye Tao on 2017/3/27.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import <SIDefine/SIGlobalMacro.h>
#import <SITheme/SIColor.h>
#import <SITheme/SIFont.h>
#import <SIUIKit/SIMessageBox.h>
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

@property (nonatomic, assign) BOOL hideNavigationBar;

#pragma mark - TabBar

@property (nonatomic, assign) BOOL alwaysShowTabBar;

#pragma mark - Appeared

@property (nonatomic, readonly) BOOL si_viewAppeared;

@property (nonatomic, assign) BOOL killWhenPushed;

@end

@interface SIViewController (SINavi)

- (UIBarButtonItem *)barItemWithTitle:(NSString *)title selector:(SEL)selector;

- (UIBarButtonItem *)barItemWithIcon:(NSString *)icon selector:(SEL)selector;

@end
