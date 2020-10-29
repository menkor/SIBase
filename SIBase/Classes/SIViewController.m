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
#import <SICollector/SICollector.h>
#import <SIDefine/SIGlobalEvent.h>
#import <SIRequestCenter/SIRequestCenter.h>
#import <SITheme/SIColor.h>
#import <SIUtils/NSObject+SIKit.h>

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

@property (nonatomic, strong) SINavigationBar *naviBar;

@property (nonatomic, assign) BOOL si_viewAppeared;

@property (nonatomic, assign) BOOL si_customHitTest;

@property (nonatomic, strong) AFNetworkReachabilityManager *si_reachabilityManager;

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

- (void)setMonitorNetwork:(BOOL)monitorNetwork {
    _monitorNetwork = monitorNetwork;
    if (monitorNetwork) {
        AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager manager];
        __weak __typeof__(self) weak_self = self;
        [reachabilityManager startMonitoring];
        [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            [weak_self reachabilityHandler:status];
        }];
        self.si_reachabilityManager = reachabilityManager;
    } else {
        [self.si_reachabilityManager stopMonitoring];
        self.si_reachabilityManager = nil;
    }
}

- (void)navigationBarHandler {
    if ([self.parentViewController isKindOfClass:[UINavigationController class]]) {
        if (self.navigationController.topViewController == self) {
            self.navigationController.navigationBarHidden = _customNaviBar || _hideNavigationBar;
        }
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.si_viewAppeared = YES;
    if (_hideNavigationBarLine) {
        [self showNavigationBarLine:NO];
    }
    if (self.monitorNetwork) {
        [self.si_reachabilityManager startMonitoring];
    }
    [self navigationBarHandler];
    if (self.affair) {
        [self.affair si_push];
    }
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
    [self eventTracking];
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
    if (self.monitorNetwork) {
        [self.si_reachabilityManager stopMonitoring];
    }
    [self.view endEditing:YES];
    if (_hideNavigationBarLine) {
        [self showNavigationBarLine:YES];
    }
}

- (void)reachabilityHandler:(AFNetworkReachabilityStatus)status {
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

- (void)setAffair:(SIAffairInfo *)affair {
    _affair = affair;
    [affair si_push];
}

- (void)setReloadWhenAppear:(BOOL)reloadWhenAppear {
    if (reloadWhenAppear == _reloadWhenAppear) {
        return;
    }
    _reloadWhenAppear = reloadWhenAppear;
    if (!_reloadWhenAppear) {
        [self loadData];
    }
}

- (void)setCustomNaviBar:(BOOL)customNaviBar {
    _customNaviBar = customNaviBar;
    if (_customNaviBar && !_naviBar) {
        _naviBar = [SINavigationBar create];
        _naviBar.owner = self;
        [_naviBar setTheme:SINavigationThemeClear];
        [self.view addSubview:_naviBar];
        CGFloat height = 44.0;
        height += IS_IPHONE_X() ? kStatusBarHeight : 20;
        [_naviBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(self.view);
            make.height.mas_equalTo(height);
        }];
        NSArray *viewControllers = self.navigationController.viewControllers;
        if (viewControllers.count > 1 && viewControllers.lastObject == self) {
            [_naviBar.left.add itemWithType:SINavigationItemTypeCustomImage resource:@"ic_back_chevron" selector:@selector(goBack)];
        }
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

@implementation SIViewController (SIAlert)

- (void)alert:(NSString *)message
     okButton:(NSString *)buttonTitle
      handler:(void (^)(SIAlertAction *action))handler {
    [self alert:message okButton:buttonTitle cancelButton:@"取消" handler:handler];
}

- (void)alertArray:(NSMutableArray<NSString *> *)messageArray
          okButton:(NSString *)buttonTitle
           handler:(void (^)(SIAlertAction *action))handler {
    if (messageArray.count > 0) {
        NSString *message = messageArray.firstObject;
        [messageArray removeObjectAtIndex:0];
        [self alert:message
                okButton:buttonTitle
            cancelButton:@"取消"
                 handler:^(SIAlertAction *action) {
                     if (messageArray.count > 0) {
                         [self alertArray:messageArray okButton:buttonTitle handler:handler];
                     } else {
                         handler(action);
                     }
                 }];
    }
}

- (void)alert:(NSString *)message
        okButton:(NSString *)okButtonTitle
    cancelButton:(NSString *)cancelButtonTitle
         handler:(void (^)(SIAlertAction *action))handler {
    SIAlertView *alert = [SIAlertView alertControllerWithTitle:nil message:message];
    [alert addAction:[SIAlertAction actionWithTitle:okButtonTitle
                                              style:SIAlertActionStyleDefault
                                            handler:handler]];
    [alert addAction:[SIAlertAction actionWithTitle:cancelButtonTitle
                                              style:SIAlertActionStyleCancel
                                            handler:[cancelButtonTitle isEqualToString:@"取消"] ? nil : handler]];
    [self.view endEditing:YES];
    [alert show];
}

- (void)alert:(NSString *)message
    okButtonArray:(NSArray *)okButtonTitleArray
     cancelButton:(NSString *)cancelButtonTitle
          handler:(void (^)(SIAlertAction *action))handler {
    SIAlertView *alert = [SIAlertView alertControllerWithTitle:nil message:message];
    for (NSString *obj in okButtonTitleArray) {
        [alert addAction:[SIAlertAction actionWithTitle:obj
                                                  style:SIAlertActionStyleDefault
                                                handler:handler]];
    }

    [alert addAction:[SIAlertAction actionWithTitle:cancelButtonTitle
                                              style:SIAlertActionStyleCancel
                                            handler:[cancelButtonTitle isEqualToString:@"取消"] ? nil : handler]];
    [self.view endEditing:YES];
    [alert show];
}

- (void)showMessage:(NSString *)message title:(NSString *)title {
    [self.view endEditing:YES];
    SIMessageBox *box = [SIMessageBox boxWithType:SIMessageBoxStatusSuccess title:title message:message];
    [box show];
}

- (void)showMessage:(NSString *)message {
    if (self.viewLoaded) {
        [self.view endEditing:YES];
    }
    [SIMessageBox showMessage:message];
}

- (void)showError:(NSString *)error {
    if (self.viewLoaded) {
        [self.view endEditing:YES];
    }
    [SIMessageBox showError:error];
}

- (void)showInfo:(NSString *)info {
    if (self.viewLoaded) {
        [self.view endEditing:YES];
    }
    [SIMessageBox showInfo:info];
}

- (void)showWaiting:(NSString *)hint {
    if (self.viewLoaded) {
        [self.view endEditing:YES];
    }
    [SIMessageBox showWaiting:hint];
}

- (void)hideWaiting {
    [SIMessageBox hideWaiting];
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
