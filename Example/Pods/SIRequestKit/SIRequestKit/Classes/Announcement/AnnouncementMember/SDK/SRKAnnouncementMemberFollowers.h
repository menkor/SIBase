//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAnnouncementMemberFollowers.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIRoleInfoItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /announcement/member/followers
 method     : GET
 summary    : 得到一个公告所有关注者
 type       : RoleInfoVO
 response   : SIRoleInfoItem
*/
@interface SRKAnnouncementMemberFollowers : NSObject

/**
 paramType  : query
 key        : announcementId
 type       : int64
 required   : true
 notes      : announcementId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *announcementId;

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