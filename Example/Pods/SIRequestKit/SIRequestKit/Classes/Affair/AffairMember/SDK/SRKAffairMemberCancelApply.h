//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAffairMemberCancelApply.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 path       : /affair/affair_member/cancel_apply
 method     : POST
 summary    : 取消申请加入事务
 type       : int32
 response   : int32_t
*/
@interface SRKAffairMemberCancelApply : NSObject

/**
 paramType  : header
 key        : X-SIMU-UserId
 type       : int64
 required   : true
 notes      : X-SIMU-UserId
 rename     : X_SIMU_UserId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *X_SIMU_UserId;

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
 paramType  : header
 key        : X-SIMU-RoleId
 type       : int64
 required   : true
 notes      : X-SIMU-RoleId
 rename     : X_SIMU_RoleId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *X_SIMU_RoleId;

/**
 paramType  : query
 key        : targetAffairId
 type       : int64
 required   : true
 notes      : targetAffairId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *targetAffairId;

- (NSDictionary *__nonnull)srk_config;

@end