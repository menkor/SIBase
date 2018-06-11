//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SITransferPersonnelForm.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SITransferPersonnelForm : NSObject

/**
 format      : int64
 type        : int64_t
 name        : beAllocatedRoleId
 notes       : 被分配的角色id,如果不分配角色,或者是分配新建角色,则传0
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *beAllocatedRoleId;

/**
 format      : int64
 type        : int64_t
 name        : beTransferredRoleId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *beTransferredRoleId;

/**
 format      : boolean
 type        : BOOL
 name        : ifHire
 notes       : 是否赋予人事关系
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *ifHire;

/**
 format      : string
 type        : NSString
 name        : reason
*/
@property (nonatomic, copy, nullable) NSString *reason;

/**
 format      : string
 type        : NSString
 name        : roleTitle
 notes       : 被分配的角色title,如果不分配角色,则不传
*/
@property (nonatomic, copy, nullable) NSString *roleTitle;

/**
 format      : int64
 type        : int64_t
 name        : toAffairId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *toAffairId;

@end