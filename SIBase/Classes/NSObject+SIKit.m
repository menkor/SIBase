//
//  NSObject+SIKit.m
//  SuperId
//
//  Created by Ye Tao on 2017/5/27.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import "NSObject+SIKit.h"
#import <SIUtils/SICache.h>
#import <YYKit/NSObject+YYModel.h>
#import <SIRequestCenter/SIRequestCenter.h>

@implementation NSObject (SICopy)

- (id)si_copy {
    return [[self class] modelWithDictionary:[self modelToJSONObject]];
}

@end

@implementation NSObject (SIContainer)

- (void)si_push {
    //if ([NSStringFromClass([self class]) isEqualToString:@"SIAffairInfo"]) {
    //    SIDLog(@"si_push %@", self);
    //}
    [[SICache memmoryCache] setObject:self forKey:NSStringFromClass([self class])];
}

- (void)si_pop {
    //if ([NSStringFromClass([self class]) isEqualToString:@"SIAffairInfo"]) {
    //    SIDLog(@"si_pop %@", self);
    //}
    [[SICache memmoryCache] setObject:nil forKey:NSStringFromClass([self class])];
}

+ (instancetype)si_current {
    id some = [[SICache memmoryCache] objectForKey:NSStringFromClass(self)];
    return some;
}

+ (instancetype)si_fromAddress:(NSString *)address {
    return (__bridge id)(void *)[address integerValue];
}

@end

@implementation NSObject (SIRequest)

- (nullable NSURLSessionDataTask *)requestWithCompletion:(SIRequestCompletionBlock)completion {
    return [self requestWithCustomBlock:nil completion:completion];
}

- (nullable NSURLSessionDataTask *)requestWithCustomBlock:(void (^)(AFHTTPSessionManager *, id))customBlock completion:(SIRequestCompletionBlock)completion {
    return [[SIRequestCenter sharedInstance] request:(id<SIRequestKitProtocol>)self customBlock:customBlock completion:completion];
}

@end