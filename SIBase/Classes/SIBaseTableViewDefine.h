//
//  SIBaseTableViewDefine.h
//  SuperId
//
//  Created by Ye Tao on 2017/7/7.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#ifndef SIBaseTableViewDefine_h
#define SIBaseTableViewDefine_h

typedef NSString * (^SIBaseTableCellReuseIdentifierBlock)(NSIndexPath *indexPath);

typedef UITableViewCell * (^SIBaseTableCellCustomCellBlock)(NSIndexPath *indexPath, UITableViewCell *cell);

static NSString *const kSISingleSectionKey = @"SingleSection";

static NSString *const kSINoPermossionKey = @"NoPermossion";

static const CGFloat kSIBaseTableViewDefaultCellHeight = 60;

/**
 optional protocol
 */
@protocol SIFormItemProtocol <NSObject>

@optional
@property (nonatomic, copy) NSString *key;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) BOOL selected;

@property (nonatomic, strong) id data;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, copy) NSDictionary *theme;

@end

#import "SIFormItem.h"

static NSString *const kSIFormItemKeyTitle = @"title";

static NSString *const kSIFormItemKeyPath = @"key";

static NSString *const kSIFormItemKeyCell = @"cell";

static NSString *const kSIFormItemKeyHeight = @"height";

#endif /* SIBaseTableViewDefine_h */
