//
//  NSObject+SIKit.h
//  SuperId
//
//  Created by Ye Tao on 2017/5/27.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AFHTTPSessionManager;

@interface NSObject (SICopy)

- (id)si_copy;

@end

@interface NSObject (SIContainer)

- (void)si_push;

- (void)si_pop;

+ (instancetype)si_current;

+ (instancetype)si_fromAddress:(NSString *)address;

@end

@interface NSObject (SIRequest)

- (nullable NSURLSessionDataTask *)requestWithCompletion:(void (^__nullable)(BOOL isSuccess, __nullable id result))completion;

- (nullable NSURLSessionDataTask *)requestWithCustomBlock:(void (^__nullable)(AFHTTPSessionManager *manager, id api))customBlock
                                               completion:(void (^__nullable)(BOOL isSuccess, __nullable id result))completion;

@end
