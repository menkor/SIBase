//
//  SIRequestUnit.m
//  SuperId
//
//  Created by Ye Tao on 2017/3/13.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import "_SIRequestUnit.h"
#import "_SIRequestPrivateDefine.h"
#import <AFNetworking/AFHTTPSessionManager.h>

@interface AFHTTPSessionManager (Method)

- (NSURLSessionDataTask *)requestWithMethod:(NSString *)method
                                  URLString:(NSString *)URLString
                                 parameters:(id)parameters
                                    success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                    failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end

@interface AFHTTPSessionManager ()

- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                      parameters:(id)parameters
                                  uploadProgress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                downloadProgress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

@end

@implementation AFHTTPSessionManager (Method)

- (NSURLSessionDataTask *)requestWithMethod:(NSString *)method
                                  URLString:(NSString *)URLString
                                 parameters:(id)parameters
                                    success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                    failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    NSURLSessionDataTask *dataTask = [self dataTaskWithHTTPMethod:method
                                                        URLString:URLString
                                                       parameters:parameters
                                                   uploadProgress:nil
                                                 downloadProgress:nil
                                                          success:success
                                                          failure:failure];

    [dataTask resume];

    return dataTask;
}

@end

@interface _SIRequestUnit ()

@property (nonatomic, assign) NSTimeInterval timeout;

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@property (nonatomic, assign) NSTimeInterval duration;

@property (nonatomic, strong) NSDate *start;

@end

@implementation _SIRequestUnit

+ (instancetype)unitWithManager:(AFHTTPSessionManager * (^)(void))managerBlock
                        timeout:(NSTimeInterval)timeout
                       consumes:(NSString *)consumes {
    _SIRequestUnit *unit = [[_SIRequestUnit alloc] init];
    unit.timeout = timeout >= 0 ? timeout : SIRequestDefaultTimeout;
    if (managerBlock) {
        unit.manager = managerBlock();
    } else {
        unit.manager = [AFHTTPSessionManager manager];
        if (consumes.length == 0 || [consumes isEqualToString:@"application/json"]) {
            unit.manager.requestSerializer = [AFJSONRequestSerializer serializer];
        } else { //application/x-www-form-urlencoded
            unit.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        }
    }
    unit.manager.requestSerializer.timeoutInterval = timeout;
    return unit;
}

- (void)setCustomBlock:(void (^)(AFHTTPSessionManager *))customBlock {
    _customBlock = [customBlock copy];
    if (_customBlock) {
        _customBlock(self.manager);
    }
}

- (nullable NSURLSessionDataTask *)requestWithMethod:(NSString *)method
                                                 uri:(NSString *)uri
                                              header:(NSDictionary *)header
                                               param:(NSMutableDictionary *)param
                                          completion:(void (^)(BOOL isSuccess, id result, NSURLResponse *response))completion {
    self.start = [NSDate date];
    AFHTTPSessionManager *manager = self.manager;
    NSParameterAssert([method isEqualToString:@"POST"] ||
                      [method isEqualToString:@"GET"] ||
                      [method isEqualToString:@"PUT"]);
    __weak typeof(manager) weak_manager = manager;
    if (header.count > 0) {
        AFHTTPRequestSerializer *requestSerializer = manager.requestSerializer;
        [header enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key,
                                                    id _Nonnull obj,
                                                    BOOL *_Nonnull stop) {
            [requestSerializer setValue:[obj description] forHTTPHeaderField:key];
        }];
    }
    return [manager requestWithMethod:method
        URLString:uri
        parameters:param
        success:^(NSURLSessionDataTask *task, id responseObject) {
            NSDate *end = [NSDate date];
            self.duration = [end timeIntervalSinceDate:self.start];
            if (completion) {
                completion(YES, responseObject, task.response);
            }
            [weak_manager invalidateSessionCancelingTasks:YES];
        }
        failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSDate *end = [NSDate date];
            self.duration = [end timeIntervalSinceDate:self.start];
            if (completion) {
                completion(NO, error, task.response);
            }
            [weak_manager invalidateSessionCancelingTasks:YES];
        }];
}

@end