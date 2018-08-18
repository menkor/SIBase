//
//  SITableViewController.h
//  SuperId
//
//  Created by Ye Tao on 2017/3/28.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import "SIBaseTableViewDefine.h"
#import "SIViewController.h"
#import <SIUIKit/SIEmptyView.h>
#import <UIKit/UIKit.h>

@interface SITableViewController : SIViewController <UITableViewDelegate, UITableViewDataSource>

#pragma mark - Style

- (instancetype)initWithStyle:(UITableViewStyle)style NS_DESIGNATED_INITIALIZER;

@property (nonatomic, strong, readonly) UITableView *tableView;

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, assign) BOOL pullToRefresh;

#pragma mark - Load More

@property (nonatomic, assign) BOOL pullToLoadMore;

- (void)loadMoreData;

#pragma mark - Data Source

@property (nonatomic, strong) NSArray /* <NSString *> or <NSNumber *> */ *section;

@property (nonatomic, strong) NSMutableDictionary<id, NSArray *> *dataSource;

- (id)objectAtIndexPath:(NSIndexPath *)indexPath;

#pragma mark - Reuse Identifier

@property (nonatomic, strong) Class cellClass;

@property (nonatomic, copy) NSArray<Class> *cellClassArray;

@property (nonatomic, readonly) NSArray<NSString *> *cellIdentifierArray;

@property (nonatomic, copy) NSString * (^reuseIdentifierBlock)(NSIndexPath *indexPath);

#pragma mark - Action

- (void)action:(id)action atIndexPath:(NSIndexPath *)indexPath;

#pragma mark - Empty

/**
 @{@"title":@"", @"icon":@""}
 */
@property (nonatomic, copy) NSDictionary *emptyTheme;

#pragma mark - Reload

- (void)reloadIndexPath:(NSIndexPath *)indexPath;

- (void)reloadIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

- (void)removeIndexPath:(NSIndexPath *)indexPath;

#pragma mark - Search

@property (nonatomic, copy, readonly) NSString *keyword;

@end

@interface SIViewController (SISearch)

- (UISearchController *)searchControllerWithResults:(SIViewController *)results;

- (void)searchWithKeyword:(NSString *)keyword;

@end
