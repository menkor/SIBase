//
//  SIRequest.m
//  SuperId
//
//  Created by Ye Tao on 2018/5/11.
//  Copyright © 2018年 SuperID. All rights reserved.
//

#import "SIRequest.h"
#import "NSObject+SIKit.h"

@implementation SIRequest

+ (RACSignal *)request:(id)api {
    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [api requestWithCompletion:^(BOOL isSuccess, id _Nullable result) {
            if (isSuccess) {
                [subscriber sendNext:result];
                [subscriber sendCompleted];
            } else {
                [subscriber sendError:result];
            }
        }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

@end

@implementation NSObject (SIRequest_RAC)

- (RACSignal *)request {
    return [SIRequest request:self];
}

@end
