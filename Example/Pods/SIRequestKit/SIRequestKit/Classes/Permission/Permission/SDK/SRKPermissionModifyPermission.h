//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKPermissionModifyPermission.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIRolePermissionSettingItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /permission/api/role/set/{affairId}/{roleId}
 method     : PUT
 summary    : 设置角色权限
 type       : boolean
 response   : BOOL
*/
@interface SRKPermissionModifyPermission : NSObject

/**
 paramType  : header
 key        : X-SIMU-RoleId
 type       : int64
 required   : false
 notes      : 
 rename     : X_SIMU_RoleId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *X_SIMU_RoleId;

/**
 paramType  : path
 key        : affairId
 type       : int64
 required   : true
 notes      : 
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *affairId;

/**
 paramType  : path
 key        : roleId
 type       : int64
 required   : true
 notes      : 
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *roleId;

/**
 paramType  : body
 key        : identity
 type       : RolePermissionSettingDTO
 required   : true
 notes      : 
*/
@property (nonatomic, strong, nullable) SIRolePermissionSettingItem *identity;

- (NSDictionary *__nonnull)srk_config;

@end