//
//  _SIRequestUnit.h
//  SuperId
//
//  Created by Ye Tao on 2017/3/13.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import "SIRequestDefine.h"
#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;
@interface _SIRequestUnit : NSObject

+ (instancetype)unitWithManager:(AFHTTPSessionManager * (^)(void))managerBlock timeout:(NSTimeInterval)timeout consumes:(NSString *)consumes;

- (nullable NSURLSessionDataTask *)requestWithMethod:(NSString *)method
                                                 uri:(NSString *)uri
                                              header:(NSDictionary *)header
                                               param:(NSDictionary *)param
                                          completion:(void (^)(BOOL isSuccess, id result, NSURLResponse *response))completion;

@property (nonatomic, copy) void (^customBlock)(AFHTTPSessionManager *manager);

@property (nonatomic, readonly, strong) AFHTTPSessionManager *manager;

@property (nonatomic, readonly) NSTimeInterval duration;

@end
