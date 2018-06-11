//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SIAffairInfo.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIAffairPublicMemberItem.h"
#import "SIAffairPublicResourceItem.h"
#import "SIAffairPublicRoleItem.h"
#import <Foundation/Foundation.h>

@interface SIAffairInfo : NSObject

/**
 format      : int64
 type        : int64_t
 name        : affairMemberId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *affairMemberId;

/**
 format      : string
 type        : NSString
 name        : allianceCode
*/
@property (nonatomic, copy, nullable) NSString *allianceCode;

/**
 format      : int64
 type        : int64_t
 name        : allianceId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *allianceId;

/**
 format      : string
 type        : NSString
 name        : allianceName
*/
@property (nonatomic, copy, nullable) NSString *allianceName;

/**
 format      : string
 type        : NSString
 name        : alliancePermissions
*/
@property (nonatomic, copy, nullable) NSString *alliancePermissions;

/**
 format      : boolean
 type        : BOOL
 name        : applying
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *applying;

/**
 format      : string
 type        : NSString
 name        : avatar
*/
@property (nonatomic, copy, nullable) NSString *avatar;

/**
 format      : boolean
 type        : BOOL
 name        : core
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *core;

/**
 format      : string
 type        : NSString
 name        : covers
*/
@property (nonatomic, copy, nullable) NSString *covers;

/**
 format      : string
 type        : NSString
 name        : description
*/
@property (nonatomic, copy, nullable) NSString *desc;

/**
 format      : boolean
 type        : BOOL
 name        : disabled
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *disabled;

/**
 format      : int32
 type        : int32_t
 name        : guestLimit
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *guestLimit;

/**
 format      : int64
 type        : int64_t
 name        : id
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *id_p;

/**
 format      : boolean
 type        : BOOL
 name        : isStuck
 notes       : 是否置顶
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *isStuck;

/**
 format      : int64
 type        : int64_t
 name        : joinedRoles
*/
@property (nonatomic, strong, nullable) NSArray<NSNumber /*int64_t*/ *> *joinedRoles;

/**
 format      : int32
 type        : int32_t
 name        : level
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *level;

/**
 format      : AffairPublicMemberDTO
 type        : SIAffairPublicMemberItem
 name        : memberPublic
*/
@property (nonatomic, strong, nullable) SIAffairPublicMemberItem *memberPublic;

/**
 format      : double
 type        : double
 name        : modifyTime
*/
@property (nonatomic, strong, nullable) NSNumber /*double*/ *modifyTime;

/**
 format      : int32
 type        : int32_t
 name        : mold
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *mold;

/**
 format      : string
 type        : NSString
 name        : name
*/
@property (nonatomic, copy, nullable) NSString *name;

/**
 format      : object
 type        : id
 name        : overView
*/
@property (nonatomic, strong, nullable) id overView;

/**
 format      : int64
 type        : int64_t
 name        : ownerRoleId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *ownerRoleId;

/**
 format      : string
 type        : NSString
 name        : ownerRoleName
*/
@property (nonatomic, copy, nullable) NSString *ownerRoleName;

/**
 format      : int64
 type        : int64_t
 name        : ownerUserId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *ownerUserId;

/**
 format      : string
 type        : NSString
 name        : ownerUsername
*/
@property (nonatomic, copy, nullable) NSString *ownerUsername;

/**
 format      : int64
 type        : int64_t
 name        : parentId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *parentId;

/**
 format      : string
 type        : NSString
 name        : permissions
*/
@property (nonatomic, copy, nullable) NSString *permissions;

/**
 format      : boolean
 type        : BOOL
 name        : permitted
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *permitted;

/**
 format      : int32
 type        : int32_t
 name        : personnelState
 notes       : 人才库成员状态:0是正常成员，1不是成员，2是邀请中成员
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *personnelState;

/**
 format      : int32
 type        : int32_t
 name        : publicType
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *publicType;

/**
 format      : AffairPublicResourceDTO
 type        : SIAffairPublicResourceItem
 name        : resourcePublic
*/
@property (nonatomic, strong, nullable) SIAffairPublicResourceItem *resourcePublic;

/**
 format      : int64
 type        : int64_t
 name        : roleId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *roleId;

/**
 format      : AffairPublicRoleDTO
 type        : SIAffairPublicRoleItem
 name        : rolePublic
*/
@property (nonatomic, strong, nullable) SIAffairPublicRoleItem *rolePublic;

/**
 format      : string
 type        : NSString
 name        : shortName
*/
@property (nonatomic, copy, nullable) NSString *shortName;

/**
 format      : boolean
 type        : BOOL
 name        : star
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *star;

/**
 format      : boolean
 type        : BOOL
 name        : stuck
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *stuck;

/**
 format      : string
 type        : NSString
 name        : superid
*/
@property (nonatomic, copy, nullable) NSString *superid;

/**
 format      : string
 type        : NSString
 name        : tags
*/
@property (nonatomic, copy, nullable) NSString *tags;

/**
 format      : int32
 type        : int32_t
 name        : rolePermission
 notes       : 脚本添加,存储角色权限用
*/
@property (nonatomic, strong, nullable) NSArray<NSNumber /*int32_t*/ *> *rolePermission;

/**
 format      : int32
 type        : int32_t
 name        : resourceId
 notes       : 脚本添加,存储resourceId用
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *resourceId;

@end