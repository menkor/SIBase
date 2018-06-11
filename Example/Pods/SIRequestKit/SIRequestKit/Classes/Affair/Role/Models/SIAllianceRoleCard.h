//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SIAllianceRoleCard.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIAllianceRoleCard : NSObject

/**
 format      : string
 type        : NSString
 name        : affairName
*/
@property (nonatomic, copy, nullable) NSString *affairName;

/**
 format      : string
 type        : NSString
 name        : affairShortName
*/
@property (nonatomic, copy, nullable) NSString *affairShortName;

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
 format      : string
 type        : NSString
 name        : avatar
*/
@property (nonatomic, copy, nullable) NSString *avatar;

/**
 format      : int64
 type        : int64_t
 name        : belongAffairId
 notes       : 主事务id
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *belongAffairId;

/**
 format      : int32
 type        : int32_t
 name        : level
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *level;

/**
 format      : string
 type        : NSString
 name        : permissions
*/
@property (nonatomic, copy, nullable) NSString *permissions;

/**
 format      : int64
 type        : int64_t
 name        : roleId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *roleId;

/**
 format      : string
 type        : NSString
 name        : roleTitle
*/
@property (nonatomic, copy, nullable) NSString *roleTitle;

/**
 format      : int32
 type        : int32_t
 name        : state
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *state;

/**
 format      : string
 type        : NSString
 name        : superid
*/
@property (nonatomic, copy, nullable) NSString *superid;

/**
 format      : int64
 type        : int64_t
 name        : userId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *userId;

/**
 format      : string
 type        : NSString
 name        : username
*/
@property (nonatomic, copy, nullable) NSString *username;

@end