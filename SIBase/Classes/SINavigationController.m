//
//  SINavigationController.m
//  SuperId
//
//  Created by Ye Tao on 2017/3/27.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import "SINavigationController.h"
#import "SIViewController.h"
#import <SIDefine/SIDefine.h>
#import <SITheme/SIColor.h>

@interface SIViewController ()

@property (nonatomic, assign) BOOL si_viewAppeared;

@end

@interface SINavigationController ()

@property (nonatomic, weak) SIViewController *next;

@end

@implementation SINavigationController

- (void)setGlobalUI {
    [self.navigationBar setBarTintColor:[SIColor whiteColor]];
    [self.navigationBar setBackgroundColor:[SIColor whiteColor]];
    [self.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"ic_back_chevron"]];
    [self.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"ic_back_chevron"]];
    if (@available(iOS 11.0, *)) {
        //do nothing
        //SIDLog(@"remove sonar warning");
    } else {
        [UIBarButtonItem.appearance setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -64) forBarMetrics:UIBarMetricsDefault];
    }
    self.navigationBar.barStyle = UIBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setGlobalUI];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(SIViewController *)viewController animated:(BOOL)animated {
    if (self.next) {
        return;
    }
    SIViewController *source = (SIViewController *)self.topViewController;
    if ([viewController respondsToSelector:@selector(affair)] &&
        [source respondsToSelector:@selector(affair)] &&
        source.affair) {
        [viewController setAffair:source.affair];
    }
    self.next = viewController;
    source.si_viewAppeared = NO;
    [super pushViewController:viewController animated:animated];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.next = nil;
    });
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    SIViewController *source = (SIViewController *)self.topViewController;
    source.si_viewAppeared = NO;
    return [super popViewControllerAnimated:animated];
}

@end
