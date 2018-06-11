//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAnnouncementMemberReceiverInfo.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIAnnouncementReceiverInfoItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /announcement/member/receiver_info
 method     : GET
 summary    : 得到接收方相关信息
 type       : AnnouncementReceiverInfoVO
 response   : SIAnnouncementReceiverInfoItem
*/
@interface SRKAnnouncementMemberReceiverInfo : NSObject

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
 The class of response object[s]
 @return [SIAnnouncementReceiverInfoItem class]*/
+ (Class /*SIAnnouncementReceiverInfoItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end