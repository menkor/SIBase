//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAnnouncementCommentModifyPublic.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIAnnouncementCommentItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /announcement/comment/modify_public
 method     : POST
 summary    : 管理评论区
 type       : AnnouncementCommentVO
 response   : SIAnnouncementCommentItem
*/
@interface SRKAnnouncementCommentModifyPublic : NSObject

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
 paramType  : header
 key        : X-SIMU-ResourceId
 type       : int64
 required   : true
 notes      : X-SIMU-ResourceId
 rename     : X_SIMU_ResourceId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *X_SIMU_ResourceId;

/**
 paramType  : query
 key        : announcementId
 type       : int64
 required   : true
 notes      : announcementId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *announcementId;

/**
 paramType  : query
 key        : commentPublicType
 type       : int32
 required   : true
 notes      : commentPublicType
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *commentPublicType;

/**
 The class of response object[s]
 @return [SIAnnouncementCommentItem class]*/
+ (Class /*SIAnnouncementCommentItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end