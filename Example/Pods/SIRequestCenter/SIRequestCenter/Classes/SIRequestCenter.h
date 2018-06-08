//
//  SIRequestCenter.h
//  SuperId
//
//  Created by Ye Tao on 2017/3/13.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import "SIRequestDefine.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class AFHTTPSessionManager;
@interface SIRequestCenter : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, copy, nullable) NSDictionary *linkDict;

@property (nonatomic, copy) NSString *baseUri;

@property (nonatomic, assign) NSTimeInterval timeout;

@property (nonatomic, assign) BOOL verbose;

- (nullable NSURLSessionDataTask *)request:(id<SIRequestKitProtocol>)model
                               customBlock:(void (^)(AFHTTPSessionManager *manager, id api))customBlock
                                completion:(SIRequestCompletionBlock)completion;

#pragma mark - Error Handler

- (void)setErrorHandler:(void (^)(NSError *error))errorHandler;

#pragma mark - Log Handler

- (void)setLogHandler:(void (^)(NSString *log))logHandler;

#pragma mark - Monitor Handler

- (void)setMonitorHandler:(void (^)(id api, SIRequestStatus status, CGFloat duration))monitorHandler;

#pragma mark - Serialization

@property (nonatomic, copy) id (^serialization)(id jsonObject, NSString *className);

@property (nonatomic, copy) id (^deserialization)(id object);

#pragma mark - Custom

@property (nonatomic, copy, nullable) id (^customBlock)(AFHTTPSessionManager *manager, id api);

@property (nonatomic, copy, nullable) AFHTTPSessionManager * (^customSessionBlock)(void);

@end

NS_ASSUME_NONNULL_END
