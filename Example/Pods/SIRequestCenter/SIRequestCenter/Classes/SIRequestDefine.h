//
//  SIRequestDefine.h
//  SuperId
//
//  Created by Ye Tao on 2017/3/13.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#ifndef SIRequestDefine_h
#define SIRequestDefine_h

#pragma mark - Result Block

#import <Foundation/Foundation.h>

typedef void (^SIRequestCompletionBlock)(BOOL isSuccess, id result);

FOUNDATION_EXPORT NSErrorDomain const SIRequestErrorDomain;

FOUNDATION_EXPORT const NSInteger SIRequestErrorCode;

FOUNDATION_EXPORT const NSTimeInterval SIRequestDefaultTimeout;

FOUNDATION_EXPORT NSString *SIRequestURLEncode(id /*NSString or NSNumber*/ value);

@protocol SIRequestKitProtocol <NSObject>

- (NSDictionary *)srk_config;

@end

typedef NS_ENUM(NSUInteger, SIRequestStatus) {
    SIRequestStatusBegin,
    SIRequestStatusFinish,
    SIRequestStatusFailed,
};

#endif /* SIRequestDefine_h */
