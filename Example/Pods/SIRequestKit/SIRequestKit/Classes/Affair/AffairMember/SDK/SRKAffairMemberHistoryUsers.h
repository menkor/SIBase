//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAffairMemberHistoryUsers.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIAllianceUserItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /affair/affair_member/history_users
 method     : GET
 summary    : 获取事务的历史盟成员
 type       : AllianceUserMVO
 response   : SIAllianceUserItem
*/
@interface SRKAffairMemberHistoryUsers : NSObject

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
 @return [SIAllianceUserItem class]*/
+ (Class /*SIAllianceUserItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end