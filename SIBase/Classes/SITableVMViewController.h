//
//  SITableVMViewController.h
//  SuperId
//
//  Created by Ye Tao on 2018/5/14.
//  Copyright © 2018年 SuperID. All rights reserved.
//

#import "SITableViewController.h"

@class SITableViewModel;
@interface SITableVMViewController : SITableViewController

- (void)bindViewModel:(__kindof SITableViewModel *)viewModel;

@end
