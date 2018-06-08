//
//  SITableViewModel.h
//  SuperId
//
//  Created by Ye Tao on 2018/5/11.
//  Copyright © 2018年 SuperID. All rights reserved.
//

#import "SIViewModel.h"
#import <Foundation/Foundation.h>

@interface SITableViewModel : SIViewModel

#pragma mark - Data Source

@property (nonatomic, strong) NSArray /* <NSString *> or <NSNumber *> */ *section;

@property (nonatomic, strong) NSMutableDictionary<id, NSArray *> *dataSource;

#pragma mark - Reuse Identifier

@property (nonatomic, strong) Class cellClass;

@property (nonatomic, copy) NSArray<Class> *cellClassArray;

@property (nonatomic, readonly) NSArray<NSString *> *cellIdentifierArray;

@property (nonatomic, copy) NSString * (^reuseIdentifierBlock)(NSIndexPath *indexPath) ;

- (id)wrap:(id)data;

@end
