//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAffairMemberAffairRoles.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIRoleInfoItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /affair/affair_member/affair_roles
 method     : GET
 summary    : 获取事务及子事务的角色和公开角色
 type       : RoleInfoVO
 response   : SIRoleInfoItem
*/
@interface SRKAffairMemberAffairRoles : NSObject

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
 The class of response object[s]
 @return [SIRoleInfoItem class]*/
+ (Class /*SIRoleInfoItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end