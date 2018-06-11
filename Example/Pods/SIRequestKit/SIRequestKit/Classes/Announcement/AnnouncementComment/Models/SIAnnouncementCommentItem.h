//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SIAnnouncementCommentItem.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIRoleInfoItem.h"
#import <Foundation/Foundation.h>

@interface SIAnnouncementCommentItem : NSObject

/**
 format      : string
 type        : NSString
 name        : content
*/
@property (nonatomic, copy, nullable) NSString *content;

/**
 format      : double
 type        : double
 name        : createTime
*/
@property (nonatomic, strong, nullable) NSNumber /*double*/ *createTime;

/**
 format      : int64
 type        : int64_t
 name        : id
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *id_p;

/**
 format      : RoleInfoDTO
 type        : SIRoleInfoItem
 name        : role
*/
@property (nonatomic, strong, nullable) SIRoleInfoItem *role;

/**
 format      : RoleInfoDTO
 type        : SIRoleInfoItem
 name        : toRole
*/
@property (nonatomic, strong, nullable) SIRoleInfoItem *toRole;

@end