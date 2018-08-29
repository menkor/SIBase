//
//  SIBaseTableViewDefine.h
//  SuperId
//
//  Created by Ye Tao on 2017/7/7.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#ifndef SIBaseTableViewDefine_h
#define SIBaseTableViewDefine_h

#import "SIFormItem.h"

typedef NSString * (^SIBaseTableCellReuseIdentifierBlock)(NSIndexPath *indexPath);

typedef UITableViewCell * (^SIBaseTableCellCustomCellBlock)(NSIndexPath *indexPath, UITableViewCell *cell);

static NSString *const kSISingleSectionKey = @"SingleSection";

static NSString *const kSINoPermossionKey = @"NoPermossion";

static const CGFloat kSIBaseTableViewDefaultCellHeight = 60;

static NSString *const kSIFormItemKeyTitle = @"title";

static NSString *const kSIFormItemKeyPath = @"key";

static NSString *const kSIFormItemKeyCell = @"cell";

static NSString *const kSIFormItemKeyHeight = @"height";

#endif /* SIBaseTableViewDefine_h */
