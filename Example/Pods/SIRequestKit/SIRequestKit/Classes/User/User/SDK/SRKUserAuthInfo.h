//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKUserAuthInfo.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIAuthInfoItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /user/api/auth-info
 method     : GET
 summary    : 得到用户的认证信息
 type       : AuthInfoVO
 response   : SIAuthInfoItem
*/
@interface SRKUserAuthInfo : NSObject

/**
 paramType  : header
 key        : X-SIMU-UserId
 type       : string
 required   : true
 notes      : X-SIMU-UserId
 rename     : X_SIMU_UserId
*/
@property (nonatomic, copy, nullable) NSString *X_SIMU_UserId;

/**
 The class of response object[s]
 @return [SIAuthInfoItem class]*/
+ (Class /*SIAuthInfoItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end