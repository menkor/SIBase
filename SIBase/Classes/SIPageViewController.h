//
//  SIPageViewController.h
//  SuperId
//
//  Created by Ye Tao on 2017/8/22.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import "SIViewController.h"

@protocol SIBasePageViewDelegate <NSObject>

@optional

- (void)willSwitchToPage:(NSUInteger)page;

- (void)didSwitchToPage:(NSUInteger)page;

@end

@interface SIPageViewController : SIViewController <SIBasePageViewDelegate>

@property (nonatomic, assign, readonly) NSInteger currentPage;

@property (nonatomic, strong) NSArray<NSString *> *pageTitleArray;

@property (nonatomic, strong) NSArray<Class> *subControllerClassArray;

@property (nonatomic, strong, readonly) NSArray<__kindof SIViewController *> *subControllerArray;

- (void)presetPages;

- (void)switchToPage:(NSUInteger)nextPage;

@property (nonatomic, assign) BOOL buildinMenu;

@property (nonatomic, assign) UIEdgeInsets insets;

@property (nonatomic, assign) BOOL scrollEnabled; //default is `YES`

- (__kindof SIViewController *)childAtPage:(NSUInteger)page;

@property (nonatomic, copy) void (^customChildBlock)(NSUInteger page, __kindof SIViewController *child);

@end
