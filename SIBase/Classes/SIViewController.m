//
//  SIViewController.m
//  SuperId
//
//  Created by Ye Tao on 2017/3/27.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import "SIViewController.h"
#import <Masonry/Masonry.h>
#import <SIDefine/SIGlobalEvent.h>
#import <SIRequestCenter/SIRequestCenter.h>
#import <SITheme/SIColor.h>
#import <SICollector/SICollector.h>

@interface SIViewController ()

@property (nonatomic, strong) SINavigationBar *naviBar;

@property (nonatomic, assign) BOOL viewAppeared;

@property (nonatomic, assign) BOOL startedNetworkActivity;

@end

@implementation SIViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _reloadWhenAppear = YES;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.hidesBottomBarWhenPushed = YES;
        self.customNetworkActivity = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = YES;
    [self defaultUI];
    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager manager];
    __weak __typeof__(self) weak_self = self;
    [reachabilityManager startMonitoring];
    [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        [weak_self reachabilityHandler:status];
    }];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _viewAppeared = YES;
    if (!self.startedNetworkActivity) {
        [self hideWaiting];
    }

    if (_reloadWhenAppear) {
        [self loadData];
    }
    if (_hideNavigationBarLine) {
        [self showNavigationBarLine:NO];
    }
    if (_customNaviBar) {
        self.navigationController.navigationBarHidden = YES;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self eventTracking];
    
}

- (void)showNavigationBarLine:(BOOL)show {
    UIImageView *line = self.navigationController.navigationBar.subviews.firstObject.subviews.firstObject;
    line.hidden = !show;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.startedNetworkActivity) {
        [self hideWaiting];
    }
    _viewAppeared = NO;
    [self.view endEditing:YES];
    if (_hideNavigationBarLine) {
        [self showNavigationBarLine:YES];
    }
    if (_customNaviBar) {
        self.navigationController.navigationBarHidden = NO;
    }
}

- (void)reachabilityHandler:(AFNetworkReachabilityStatus)status {
}

- (void)loadData {
}

- (void)defaultUI {
    self.view.backgroundColor = [SIColor whiteColor];
    NSArray *viewControllers = self.navigationController.viewControllers;
    if (viewControllers.count > 1 && viewControllers.lastObject == self) {
        self.navigationItem.hidesBackButton = YES;
        self.navigationItem.leftBarButtonItem = [self barItemWithIcon:@"ic_back_chevron" selector:@selector(goBack)];
        //修复navigationController侧滑关闭失效的问题
        self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    }
}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)goBack:(NSUInteger)level {
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

- (void)setCustomNaviBar:(BOOL)customNaviBar {
    _customNaviBar = customNaviBar;
    if (_customNaviBar && !_naviBar) {
        _naviBar = [SINavigationBar create];
        _naviBar.owner = self;
        [_naviBar setTheme:SINavigationThemeClear];
        [self.view addSubview:_naviBar];
        [_naviBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(self.view);
            make.height.mas_equalTo([[UIApplication sharedApplication] statusBarFrame].size.height + 44);
        }];
        NSArray *viewControllers = self.navigationController.viewControllers;
        if (viewControllers.count > 1 && viewControllers.lastObject == self) {
            [_naviBar.left.add itemWithType:SINavigationItemTypeCustomImage resource:@"ic_back_chevron" selector:@selector(goBack)];
        }
    }
}

- (void)setCustomNetworkActivity:(BOOL)customNetworkActivity {
    _customNetworkActivity = customNetworkActivity;
    if (_customNetworkActivity) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:kSIRequestStatusMessage object:nil];
    } else {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_requestStatus:) name:kSIRequestStatusMessage object:nil];
    }
}

- (void)_requestStatus:(NSNotification *)sender {
    if (!_viewAppeared) {
        return;
    }
    NSDictionary *userInfo = [sender object];
    SIRequestStatus status = [userInfo[@"status"] integerValue];
    if (status == SIRequestStatusBegin) {
        self.startedNetworkActivity = YES;
        [self showWaiting:self.networkActivityHint];
    } else {
        self.startedNetworkActivity = NO;
        [self hideWaiting];
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
    [self.view endEditing:YES];
    [SIMessageBox showMessage:message];
}

- (void)showError:(NSString *)error {
    [self.view endEditing:YES];
    [SIMessageBox showError:error];
}

- (void)showWaiting:(NSString *)hint {
    [self.view endEditing:YES];
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
