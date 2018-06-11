//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKUserChangePwd.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 path       : /user/api/change-pwd
 method     : POST
 summary    : 修改密码
 type       : string
 response   : NSString
*/
@interface SRKUserChangePwd : NSObject

/**
 paramType  : query
 key        : oldPwd
 type       : string
 required   : true
 notes      : oldPwd
*/
@property (nonatomic, copy, nullable) NSString *oldPwd;

/**
 paramType  : query
 key        : newPwd
 type       : string
 required   : true
 notes      : newPwd
 rename     : password
*/
@property (nonatomic, copy, nullable) NSString *password;

/**
 paramType  : header
 key        : X-SIMU-UserId
 type       : string
 required   : true
 notes      : X-SIMU-UserId
 rename     : X_SIMU_UserId
*/
@property (nonatomic, copy, nullable) NSString *X_SIMU_UserId;

- (NSDictionary *__nonnull)srk_config;

@end