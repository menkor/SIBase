//
//  SIViewController.m
//  SuperId
//
//  Created by Ye Tao on 2017/3/27.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import "SIViewController.h"
#import "SINavigationController.h"
#import <Masonry/Masonry.h>
#import <SIDefine/SIGlobalEvent.h>
#import <SITheme/SIColor.h>

@interface SINavigationController ()

@property (nonatomic, assign) BOOL si_isBeingPresented;

@end

@protocol SIControllerViewViewHitTestDelegate <NSObject>

- (UIView *)si_viewHitTest:(CGPoint)point withEvent:(UIEvent *)event;

@end

@interface SIControllerView : UIView

@property (nonatomic, weak) id<SIControllerViewViewHitTestDelegate> hitTestDelegate;

@end

@implementation SIControllerView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if ([self.hitTestDelegate respondsToSelector:@selector(si_viewHitTest:withEvent:)]) {
        UIView *hook = [self.hitTestDelegate si_viewHitTest:point withEvent:event];
        if (hook) {
            return hook;
        }
    }
    return [super hitTest:point withEvent:event];
}

@end

@interface SIViewController () <SIControllerViewViewHitTestDelegate>

@property (nonatomic, assign) BOOL si_viewAppeared;

@property (nonatomic, assign) BOOL si_customHitTest;

@end

@implementation SIViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _reloadWhenAppear = YES;
        _noReloadOnce = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)loadView {
    if (_si_customHitTest) {
        SIControllerView *view = [[SIControllerView alloc] init];
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        view.hitTestDelegate = self;
        view.autoresizesSubviews = YES;
        self.view = view;
    } else {
        [super loadView];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationBarHandler];
    self.navigationController.navigationBar.translucent = YES;
    [self defaultUI];
    // Do any additional setup after loading the view.
}

- (void)navigationBarHandler {
    if ([self.parentViewController isKindOfClass:[UINavigationController class]]) {
        if (self.navigationController.topViewController == self) {
            self.navigationController.navigationBarHidden = _hideNavigationBar;
        }
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.si_viewAppeared = YES;
    if (_hideNavigationBarLine) {
        [self showNavigationBarLine:NO];
    }
    [self navigationBarHandler];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (_noReloadOnce) {
        _noReloadOnce = NO;
    } else {
        if (_reloadWhenAppear || _reloadOnce) {
            [self loadData];
            _reloadOnce = NO;
        }
    }
}

- (void)showNavigationBarLine:(BOOL)show {
    if (![self.parentViewController isKindOfClass:[SINavigationController class]]) {
        return;
    }
    UIImageView *line = self.navigationController.navigationBar.subviews.firstObject.subviews.firstObject;
    line.hidden = !show;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.si_viewAppeared = NO;
    [self.view endEditing:YES];
    if (_hideNavigationBarLine) {
        [self showNavigationBarLine:YES];
    }
}

- (void)loadData {
}

- (void)defaultUI {
    self.view.backgroundColor = [SIColor whiteColor];
    if (self.navigationController.isBeingPresented) {
        self.navigationItem.leftBarButtonItem = [self barItemWithIcon:@"ic_back_chevron" selector:@selector(goBack)];
        return;
    }
    NSArray *viewControllers = self.navigationController.viewControllers;
    if (viewControllers.count > 1 && viewControllers.lastObject == self) {
        self.navigationItem.hidesBackButton = YES;
        self.navigationItem.leftBarButtonItem = [self barItemWithIcon:@"ic_back_chevron" selector:@selector(goBack)];
        //修复navigationController侧滑关闭失效的问题
        self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    }
}

- (void)goBack {
    SINavigationController *navi = self.navigationController;
    if (navi.si_isBeingPresented && navi.viewControllers.count == 1) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    [navi popViewControllerAnimated:YES];
}

- (void)backward:(NSUInteger)level {
    NSArray *viewControllers = self.navigationController.viewControllers;
    if (viewControllers.count > level) {
        UIViewController *target = viewControllers[viewControllers.count - level - 1];
        [self.navigationController popToViewController:target animated:YES];
    }
}

#pragma mark Did Set

- (void)setReloadWhenAppear:(BOOL)reloadWhenAppear {
    if (reloadWhenAppear == _reloadWhenAppear) {
        return;
    }
    _reloadWhenAppear = reloadWhenAppear;
    if (!_reloadWhenAppear) {
        [self loadData];
    }
}

- (void)setHideNavigationBarLine:(BOOL)hideNavigationBarLine {
    _hideNavigationBarLine = hideNavigationBarLine;
    [self showNavigationBarLine:!hideNavigationBarLine];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)shouldAutorotate {
    return NO;
}

// Which screen directions are supported.
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    if (!viewControllerToPresent.transitioningDelegate) {
        viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end

@implementation SIViewController (SINavi)

- (UIBarButtonItem *)barItemWithTitle:(NSString *)title selector:(SEL)selector {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:selector];
    item.tintColor = [SIColor colorWithHex:0x4a4a4a];
    return item;
}

- (UIBarButtonItem *)barItemWithIcon:(NSString *)icon selector:(SEL)selector {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:icon]
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:selector];
    item.tintColor = [SIColor colorWithHex:0x4a4a4a];
    return item;
}

@end
