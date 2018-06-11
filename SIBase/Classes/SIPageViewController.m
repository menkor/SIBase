//
//  SIPageViewController.m
//  SuperId
//
//  Created by Ye Tao on 2017/8/22.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import "SIPageViewController.h"
#import <Masonry/Masonry.h>
#import <SITheme/SIColor.h>
#import <SITheme/SIFont.h>
#import <YCEasyTool/NSArray+YCTools.h>
#import <YCEasyTool/YCSegmentedControl.h>

@interface SIPageViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, strong) YCSegmentedControl *segment;

@property (nonatomic, strong) UIPageViewController *pageViewController;

@property (nonatomic, strong) NSArray<__kindof SIViewController *> *subControllerArray;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, assign) CGSize segmentSize;

@property (nonatomic, assign) CGFloat topOffset;

@end

@implementation SIPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollEnabled = YES;
    self.buildinMenu = YES;
    self.customNetworkActivity = YES;
    [self presetPages];
    _currentIndex = -1;
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    if (self.buildinMenu) {
        if (CGSizeEqualToSize(self.segmentSize, CGSizeZero)) {
            self.segmentSize = CGSizeMake(CGRectGetWidth(self.view.frame), 40);
        }
        [self.pageViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(self.view);
            make.top.mas_equalTo(self.view).offset(self.topOffset > 0 ? self.topOffset : 40);
        }];
        [self.segment setSelected:YES segmentAtIndex:0];
        [self.segment layoutIfNeeded];
        [self.view bringSubviewToFront:self.segment];
    } else {
        [self.pageViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
        }];
    }
    [self switchToPage:0];
    self.hideNavigationBarLine = NO;
    // Do any additional setup after loading the view.
}

- (void)presetPages {
}

#pragma mark - Transition

- (void)switchToPage:(NSUInteger)nextPage {
    if (nextPage >= self.subControllerArray.count) {
        return;
    }
    UIPageViewControllerNavigationDirection direction =
        nextPage == 0 ? UIPageViewControllerNavigationDirectionReverse : UIPageViewControllerNavigationDirectionForward;
    SIViewController *toVC = self.subControllerArray[nextPage];
    if (toVC.affair != self.affair) {
        toVC.affair = self.affair;
    }
    if ([self respondsToSelector:@selector(willSwitchToPage:)]) {
        [self willSwitchToPage:nextPage];
    }
    self.currentIndex = nextPage;
    __weak __typeof__(self) weak_self = self;
    [self.pageViewController setViewControllers:@[toVC]
                                      direction:direction
                                       animated:NO
                                     completion:^(BOOL finished) {
                                         if ([weak_self respondsToSelector:@selector(didSwitchToPage:)]) {
                                             [weak_self didSwitchToPage:weak_self.currentIndex];
                                         }
                                     }];
}

#pragma mark - PageViewController

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController
               viewControllerBeforeViewController:(__kindof UIViewController *)viewController {
    NSInteger index = (int)[self.subControllerArray indexOfObject:viewController];
    if (index == 0) {
        return nil;
    }
    return self.subControllerArray[index - 1];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController
                viewControllerAfterViewController:(__kindof UIViewController *)viewController {
    NSUInteger index = (int)[self.subControllerArray indexOfObject:viewController];
    if (index < self.subControllerArray.count - 1) {
        return self.subControllerArray[index + 1];
    }
    return nil;
}

- (void)pageViewController:(UIPageViewController *)pageViewController
    willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    SIViewController *child = pageViewController.viewControllers.firstObject;
    NSUInteger willIndex = [self.subControllerArray indexOfObject:child];
    if ([self respondsToSelector:@selector(willSwitchToPage:)]) {
        [self willSwitchToPage:willIndex];
    }
}

- (void)pageViewController:(UIPageViewController *)pageViewController
         didFinishAnimating:(BOOL)finished
    previousViewControllers:(NSArray<__kindof UIViewController *> *)previousViewControllers
        transitionCompleted:(BOOL)completed {
    SIViewController *child = pageViewController.viewControllers.firstObject;
    self.currentIndex = [self.subControllerArray indexOfObject:child];
    [self.segment setSelected:YES segmentAtIndex:self.currentIndex];
    if ([self respondsToSelector:@selector(didSwitchToPage:)]) {
        [self didSwitchToPage:self.currentIndex];
    }
}

- (void)setScrollEnabled:(BOOL)scrollEnabled {
    _scrollEnabled = scrollEnabled;
    UIPageViewController *page = self.pageViewController;
    for (UIScrollView *view in page.view.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            view.scrollEnabled = scrollEnabled;
            break;
        }
    }
}

#pragma mark - Lazy Load

- (NSInteger)currentPage {
    return _currentIndex;
}

- (SIViewController *)childAtPage:(NSUInteger)page {
    if (self.subControllerArray.count > 0 && page < self.subControllerArray.count) {
        return self.subControllerArray[page];
    }
    return nil;
}

- (NSArray<UIViewController *> *)subControllerArray {
    if (!_subControllerArray) {
        _subControllerArray = [self.subControllerClassArray yc_mapWithBlock:^id(NSUInteger idx, Class class) {
            SIViewController *controller = [class new];
            controller.affair = self.affair;
            if (self.customChildBlock) {
                self.customChildBlock(idx, controller);
            }
            return controller;
        }];
    }
    return _subControllerArray;
}

- (UIPageViewController *)pageViewController {
    if (!_pageViewController) {
        _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                              navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                            options:nil];
        _pageViewController.dataSource = self;
        _pageViewController.delegate = self;
        _pageViewController.doubleSided = NO;
        [self addChildViewController:_pageViewController];
    }
    return _pageViewController;
}

- (YCSegmentedControl *)segment {
    if (_segment) {
        return _segment;
    }
    CGRect frame = CGRectMake(0, 0, self.segmentSize.width, self.segmentSize.height);
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:0];

    [self.pageTitleArray enumerateObjectsUsingBlock:^(id _Nonnull title,
                                                      NSUInteger idx,
                                                      BOOL *_Nonnull stop) {
        [items addObject:[[YCSegmentItem alloc] initWithTitle:title icon:nil]];
    }];
    __weak __typeof__(self) weak_self = self;
    _segment = [[YCSegmentedControl alloc] initWithFrame:frame
                                                   items:items
                                          selectionBlock:^(NSUInteger segmentIndex) {
                                              if (segmentIndex == weak_self.currentIndex) {
                                                  return;
                                              }
                                              weak_self.currentIndex = segmentIndex;
                                              [weak_self switchToPage:segmentIndex];
                                          }];
    [self.view addSubview:_segment];
    [self customSegmentItems:_segment];
    return _segment;
}

- (void)customSegmentItems:(YCSegmentedControl *)segment {
    segment.style = YCSegmentedControlStyleIndicator;
    segment.indicatorHeight = 2;
    segment.indicatorColor = [SIColor colorWithHex:0x926dea];
    segment.textAttributes = @{NSFontAttributeName: [SIFont mediumSystemFontOfSize:12],
                               NSForegroundColorAttributeName: [SIColor colorWithHex:0x9b9b9b]};
    segment.selectedTextAttributes = @{NSFontAttributeName: [SIFont mediumSystemFontOfSize:12],
                                       NSForegroundColorAttributeName: [SIColor colorWithHex:0x4a4a4a]};
    segment.color = [UIColor whiteColor];
    segment.selectedColor = [UIColor whiteColor];
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectZero];
    bottomLine.backgroundColor = [SIColor colorWithHex:0xdcdcdc];
    [segment addSubview:bottomLine];
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(segment);
        make.height.mas_equalTo(0.5);
    }];
    [segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
}

@end
