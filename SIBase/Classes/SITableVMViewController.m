//
//  SITableVMViewController.m
//  SuperId
//
//  Created by Ye Tao on 2018/5/14.
//  Copyright © 2018年 SuperID. All rights reserved.
//

#import "SITableVMViewController.h"
#import "SITableViewModel.h"

@interface SITableVMViewController ()

@property (nonatomic, strong) SITableViewModel *viewModel;

@end

@implementation SITableVMViewController

- (void)bindViewModel:(__kindof SITableViewModel *)viewModel {
    self.viewModel = viewModel;
    __weak __typeof__(self) weak_self = self;
    /// 1. 监听section的数据变化
    [RACObserve(self.viewModel, section) subscribeNext:^(id x) {
        /// 刷新数据
        __typeof__(weak_self) self = weak_self;
        [self.tableView reloadData];
    }];
    [RACObserve(self.viewModel, cellClass) subscribeNext:^(id cellClass) {
        /// 注册cell
        __typeof__(weak_self) self = weak_self;
        if (cellClass) {
            [self.tableView registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
        }
    }];
}

- (NSArray *)section {
    return self.viewModel.section;
}

- (NSMutableDictionary<id, NSArray *> *)dataSource {
    return self.viewModel.dataSource;
}

- (Class)cellClass {
    return self.viewModel.cellClass;
}

- (NSArray<Class> *)cellClassArray {
    return self.viewModel.cellIdentifierArray;
}

@end
