//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAffairMemberQuit.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 path       : /affair/affair_member/quit
 method     : POST
 summary    : 退出事务
 type       : string
 response   : NSString
*/
@interface SRKAffairMemberQuit : NSObject

/**
 paramType  : header
 key        : X-SIMU-RoleId
 type       : int64
 required   : true
 notes      : X-SIMU-RoleId
 rename     : X_SIMU_RoleId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *X_SIMU_RoleId;

/**
 paramType  : header
 key        : X-SIMU-AffairId
 type       : int64
 required   : true
 notes      : X-SIMU-AffairId
 rename     : X_SIMU_AffairId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *X_SIMU_AffairId;

/**
 paramType  : query
 key        : affairMemberId
 type       : int64
 required   : true
 notes      : affairMemberId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *affairMemberId;

/**
 paramType  : header
 key        : X-SIMU-UserId
 type       : int64
 required   : true
 notes      : X-SIMU-UserId
 rename     : X_SIMU_UserId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *X_SIMU_UserId;

- (NSDictionary *__nonnull)srk_config;

@end