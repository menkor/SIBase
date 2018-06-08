//
//  SIRequest.h
//  SuperId
//
//  Created by Ye Tao on 2018/5/11.
//  Copyright © 2018年 SuperID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface SIRequest <__covariant ValueType> : NSObject

+ (RACSignal<ValueType> *)request:(id)api;

@end

@interface NSObject (SIRequest_RAC)

- (RACSignal *)request;

@end
