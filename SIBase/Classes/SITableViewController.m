//
//  SITableViewController.m
//  SuperId
//
//  Created by Ye Tao on 2017/3/28.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import "SITableViewController.h"
#import <Masonry/Masonry.h>
#import <ReactiveObjC/NSObject+RACPropertySubscribing.h>
#import <ReactiveObjC/RACSignal.h>
#import <SIDefine/SIDataBindDefine.h>
#import <SIDefine/SIGlobalEvent.h>
#import <SITheme/SIColor.h>
#import <SIUIKit/SIRefreshHeader.h>
#import <YCEasyTool/YCPollingEntity.h>

@interface SITableViewController () <UISearchControllerDelegate, UISearchResultsUpdating>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray<NSString *> *cellIdentifierArray;

@property (nonatomic, assign) UITableViewStyle style;

@property (nonatomic, strong) SIEmptyView *emptyView;

@property (nonatomic, strong) SIAutoRefreshFooter *autoRefreshFooter;

@property (nonatomic, assign) BOOL p_autoRefreshing;

@property (nonatomic, strong) YCPollingEntity *polling;

@property (nonatomic, assign) CGFloat pollingDuration;

@end

@implementation SITableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super init];
    if (self) {
        _style = style;
        _cellHeight = kSIBaseTableViewDefaultCellHeight;
    }
    return self;
}

- (instancetype)init {
    self = [self initWithStyle:UITableViewStylePlain];
    if (self) {
    }
    return self;
}

- (void)loadMoreData {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [SIColor whiteColor];
    self.emptyTheme = @{
        kSIEmptyViewThemeTitle: @"暂无内容",
    };
    //data source
    _section = _section ?: @[kSISingleSectionKey];
    _dataSource = [@{} mutableCopy];

    //table view style
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
    self.tableView.backgroundColor = [SIColor whiteColor];
    SIRefreshHeader *header = [SIRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(_refreshAction)];
    self.tableView.mj_header = header;
    self.pollingDuration = 0.3;
    if (self.showExtraFooter) {
        UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 49)];
        self.tableView.tableFooterView = footer;
    }
}

- (void)_refreshAction {
    [self loadData];
}

- (void)reachabilityHandler:(AFNetworkReachabilityStatus)status {
    if (status == AFNetworkReachabilityStatusNotReachable) {
        //if (self->_emptyView) {
        //    [self.emptyView reloadWithData:@(SIEmptyViewTypeNoNetWork)];
        //}
    } else {
        [self loadData];
    }
}

#pragma mark - Cell

- (void)setCellClass:(Class)cellClass {
    _cellClass = cellClass;
    if (cellClass) {
        [_tableView registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
    }
}

- (void)setCellClassArray:(NSArray<Class> *)cellClassArray {
    NSMutableArray *cellIdentifierArray = [NSMutableArray array];
    [cellClassArray enumerateObjectsUsingBlock:^(Class _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        [self setCellClass:obj];
        [cellIdentifierArray addObject:NSStringFromClass(obj)];
    }];
    _cellClassArray = cellClassArray;
    _cellIdentifierArray = cellIdentifierArray;
}

#pragma mark - Refresh

- (void)setPullToRefresh:(BOOL)pullToRefresh {
    _pullToRefresh = pullToRefresh;
    if (_pullToRefresh) {
        if (self.tableView.mj_header) {
            return;
        }
        SIRefreshHeader *header = [SIRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(_refreshAction)];
        self.tableView.mj_header = header;
    } else {
        self.tableView.mj_header = nil;
    }
}

- (void)setPullToLoadMore:(BOOL)pullToLoadMore {
    _pullToLoadMore = pullToLoadMore;
    if (_pullToLoadMore) {
        if (self.tableView.mj_footer) {
            return;
        }
        self.tableView.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    } else {
        self.tableView.mj_footer = nil;
    }
}

- (void)setSection:(NSArray *)section {
    _section = section;
    self.p_autoRefreshing = NO;
}

- (void)setAutoLoadMore:(BOOL)autoLoadMore {
    _autoLoadMore = autoLoadMore;
    self.p_autoRefreshing = NO;
    if (autoLoadMore) {
        if (self.showExtraFooter) {
            self.autoRefreshFooter.frame = CGRectMake(0, 0, ScreenWidth, 44 + 49);
        } else {
            self.autoRefreshFooter.frame = CGRectMake(0, 0, ScreenWidth, 44);
        }
        self.tableView.tableFooterView = self.autoRefreshFooter;
    } else {
        self.showExtraFooter = self.showExtraFooter;
    }
}

- (void)_observeTableOffset {
    weakfy(self);
    [RACObserve(self.tableView, contentOffset) subscribeNext:^(id _Nullable x) {
        strongfy(self);
        if (!self.autoLoadMore) {
            return;
        }
        CGPoint offset = [x CGPointValue];
        CGFloat total = self.tableView.contentSize.height - CGRectGetHeight(self.tableView.frame);
        if (total < 0) {
            return;
        }
        if (offset.y >= total && !self.p_autoRefreshing && self.autoLoadMore) {
            self.p_autoRefreshing = YES;
            [self loadMoreData];
        }
    }];
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath) {
        return nil;
    }
    if (self.section.count <= indexPath.section) {
        return nil;
    }
    NSString *key = self.section[indexPath.section];
    NSArray *cellArray = self.dataSource[key];
    if (cellArray.count <= indexPath.row) {
        return nil;
    }
    return cellArray[indexPath.row];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    SIRefreshHeader *header = (SIRefreshHeader *)self.tableView.mj_header;
    [header finish];
    self.p_autoRefreshing = NO;
    if (!self.section) {
        tableView.backgroundView = self.emptyView;
        [self.emptyView reloadWithData:@(SIEmptyViewTypeNoData)];
        return 0;
    }
    if ([self.section containsObject:kSINoPermossionKey]) {
        tableView.backgroundView = self.emptyView;
        [self.emptyView reloadWithData:@(SIEmptyViewTypeNoPermission)];
        return 0;
    }
    if ([tableView.backgroundView isKindOfClass:[SIEmptyView class]]) {
        tableView.backgroundView = nil;
    }
    NSUInteger count = self.section.count;
    return count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<SIFormItemProtocol> item = [self objectAtIndexPath:indexPath];
    if ([item respondsToSelector:@selector(height)]) {
        return item.height > 0 ? item.height : _cellHeight;
    }
    return _cellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SIRefreshHeader *header = (SIRefreshHeader *)self.tableView.mj_header;
    [header finish];
    [self.tableView.mj_footer endRefreshing];
    if (self.section.count <= section) {
        return 0;
    }
    return self.dataSource[self.section[section]].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = nil;
    id<SIFormItemProtocol> data = [self objectAtIndexPath:indexPath];
    if (self.reuseIdentifierBlock) {
        identifier = self.reuseIdentifierBlock(indexPath);
    } else {
        if ([data respondsToSelector:@selector(identifier)] && [data identifier]) {
            identifier = [data identifier];
        } else {
            identifier = NSStringFromClass(self.cellClass);
        }
    }
    if (!data) {
        return [UITableViewCell new];
    }
    UITableViewCell<SIDataBindProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //NSParameterAssert(cell);
    return cell ?: [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell<SIDataBindProtocol> *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    id<SIFormItemProtocol> data = [self objectAtIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(actionBlock)]) {
        __weak __typeof__(self) weak_self = self;
        [cell setActionBlock:^(id action) {
            if ([action isKindOfClass:[NSString class]] &&
                [action isEqualToString:kSIDataBindReloadAction]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weak_self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                });
                return;
            }
            if ([data respondsToSelector:@selector(command)]) {
                id<SIFormItemCommandProtocol> command = data.command;
                if ([command respondsToSelector:@selector(execute:)]) {
                    [command execute:action];
                    return;
                }
            }
            [weak_self action:action atIndexPath:indexPath];
        }];
    }
    if ([cell respondsToSelector:@selector(reloadWithData:)]) {
        [cell reloadWithData:data];
        if ([cell respondsToSelector:@selector(bottomLine)]) {
            UIView *line = [cell valueForKey:@"_bottomLine"];
            if ([data respondsToSelector:@selector(theme)]) {
                NSDictionary *theme = data.theme;
                line.hidden = [theme[kSIFormItemThemeLast] boolValue];
            }
        }
    }
}

- (void)action:(id)action atIndexPath:(NSIndexPath *)indexPath {
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id<SIFormItemProtocol> data = [self objectAtIndexPath:indexPath];
    if ([data respondsToSelector:@selector(command)]) {
        id<SIFormItemCommandProtocol> command = data.command;
        if ([command respondsToSelector:@selector(execute:)]) {
            [command execute:nil];
            return;
        }
    }
    [self action:nil atIndexPath:indexPath];
}

- (void)reloadIndexPath:(NSIndexPath *)indexPath {
    [self reloadIndexPath:indexPath withRowAnimation:UITableViewRowAnimationNone];
}

- (void)silentReloadIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell<SIDataBindProtocol> *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [cell reloadWithData:[self objectAtIndexPath:indexPath]];
}

- (void)reloadIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation {
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

- (void)removeIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath) {
        return;
    }
    if (self.section.count <= indexPath.section) {
        return;
    }
    NSString *key = self.section[indexPath.section];
    NSMutableArray *cellArray = (NSMutableArray *)self.dataSource[key];
    if (cellArray.count <= indexPath.row) {
        return;
    }
    if ([cellArray isKindOfClass:[NSMutableArray class]]) {
        [cellArray removeObjectAtIndex:indexPath.row];
    } else if ([cellArray isKindOfClass:[NSArray class]]) {
        NSMutableArray *mutableCellArray = [cellArray mutableCopy];
        [mutableCellArray removeObjectAtIndex:indexPath.row];
        self.dataSource[key] = mutableCellArray;
    }
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView reloadData];
}

- (void)reloadDataAndKeepOffset {
    [self.tableView setContentOffset:self.tableView.contentOffset animated:NO];
    CGSize beforeContentSize = self.tableView.contentSize;
    [self.tableView reloadData];
    [self.tableView layoutIfNeeded];
    CGSize afterContentSize = self.tableView.contentSize;
    CGPoint contentOffset = self.tableView.contentOffset;
    CGPoint newOffset = CGPointMake(contentOffset.x + (afterContentSize.width - beforeContentSize.width), contentOffset.y + (afterContentSize.height - beforeContentSize.height));
    [self.tableView setContentOffset:newOffset animated:NO];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    if (self.pollingDuration == 0) {
        self.keyword = searchController.searchBar.text;
        [self searchWithKeyword:self.keyword];
        return;
    }
    [self.polling stopRunning];
    __weak __typeof__(self) weak_self = self;
    [self.polling startRunningWithBlock:^(NSTimeInterval current) {
        weak_self.keyword = searchController.searchBar.text;
        [weak_self searchWithKeyword:weak_self.keyword];
    }];
}

#pragma mark - Did Set

- (void)setCustomNaviBar:(BOOL)customNaviBar {
    [super setCustomNaviBar:customNaviBar];
    if (customNaviBar) {
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).offset(kStatusBarHeight + kNavBarHeight);
        }];
    }
}

- (void)setEmptyTheme:(NSDictionary *)emptyTheme {
    _emptyTheme = [emptyTheme copy];
    _emptyView.theme = [emptyTheme copy];
}

- (void)setShowExtraFooter:(BOOL)showExtraFooter {
    [super setShowExtraFooter:showExtraFooter];
    if (showExtraFooter) {
        UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 49)];
        self.tableView.tableFooterView = footer;
    } else {
        self.tableView.tableFooterView = nil;
    }
}

#pragma mark - Lazy Load

- (UITableView *)tableView {
    if (!self.viewLoaded) {
        return nil;
    }
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:self.style];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.estimatedRowHeight = 0;
        if (_style == UITableViewStyleGrouped) {
            _tableView.sectionFooterHeight = 0;
            _tableView.sectionHeaderHeight = 0;
        }
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
        }];
        if (self.cellClassArray) {
            self.cellClassArray = self.cellClassArray;
        } else if (self.cellClass) {
            self.cellClass = self.cellClass;
        }
    }
    return _tableView;
}

- (SIEmptyView *)emptyView {
    if (!_emptyView) {
        _emptyView = [SIEmptyView new];
        __weak __typeof__(self) weak_self = self;
        _emptyView.actionBlock = ^(id data) {
            [weak_self loadData];
        };
    }
    _emptyView.frame = self.tableView.bounds;
    _emptyView.theme = self.emptyTheme;
    return _emptyView;
}

- (YCPollingEntity *)polling {
    if (!_polling) {
        _polling = [YCPollingEntity pollingEntityWithTimeInterval:self.pollingDuration max:self.pollingDuration];
    }
    return _polling;
}

- (SIAutoRefreshFooter *)autoRefreshFooter {
    if (!_autoRefreshFooter) {
        _autoRefreshFooter = [[SIAutoRefreshFooter alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
        [self _observeTableOffset];
    }
    return _autoRefreshFooter;
}

@end

@implementation SIViewController (SISearch)

- (UISearchController *)searchControllerWithResults:(SIViewController *)results {
    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:results];
    searchController.searchResultsUpdater = (id)self;
    searchController.dimsBackgroundDuringPresentation = NO;
    searchController.hidesNavigationBarDuringPresentation = YES;
    searchController.searchBar.placeholder = @"搜索";
    //searchController.searchBar.barTintColor = [SIColor colorWithHex:0xe9e9e9];
    for (UIView *view in searchController.searchBar.subviews.firstObject.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            UIView *background = [[UIView alloc] init];
            [view addSubview:background];
            background.backgroundColor = [SIColor colorWithHex:0xe9e9e9];
            [background mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(view);
            }];
        } else {
            if (@available(iOS 13.0, *)) {
                if ([view.subviews.firstObject isKindOfClass:[UITextField class]]) {
                    view.subviews.firstObject.backgroundColor = [SIColor whiteColor];
                }
            };
        }
    }
    //self.definesPresentationContext = YES;
    searchController.searchBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 36);
    if ([self isKindOfClass:[SITableViewController class]]) {
        ((SITableViewController *)self).tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    [searchController.searchBar sizeToFit];
    searchController.delegate = (id)self;
    searchController.searchBar.delegate = (id)self;
    return searchController;
}

- (void)searchWithKeyword:(NSString *)keyword {
}

@end
