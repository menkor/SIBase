//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SIRolePermissionSettingItem.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIRolePermissionSettingItem : NSObject

/**
 format      : int64
 type        : int64_t
 name        : identityId
 notes       : 权限身份ID,不能和permissionList同时设置
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *identityId;

/**
 format      : int32
 type        : int32_t
 name        : permissionList
 notes       : 权限ID列表,不能和identityId同时设置
*/
@property (nonatomic, strong, nullable) NSArray<NSNumber /*int32_t*/ *> *permissionList;

/**
 format      : boolean
 type        : BOOL
 name        : useIdentity
 notes       : 是否使用身份ID来设置权限，设置权限时可以不传
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *useIdentity;

@end