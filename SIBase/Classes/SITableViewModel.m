//
//  SITableViewModel.m
//  SuperId
//
//  Created by Ye Tao on 2018/5/11.
//  Copyright © 2018年 SuperID. All rights reserved.
//

#import "SITableViewModel.h"
#import "SIBaseTableViewDefine.h"

@implementation SITableViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _section = _section ?: @[kSISingleSectionKey];
        _dataSource = [@{} mutableCopy];
    }
    return self;
}

- (id)wrap:(id)data {
    return data;
}

@end
