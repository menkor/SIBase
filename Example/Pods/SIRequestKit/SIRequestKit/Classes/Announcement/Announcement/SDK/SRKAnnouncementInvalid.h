//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAnnouncementInvalid.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 path       : /announcement/invalid
 method     : POST
 summary    : 失效发布
 type       : boolean
 response   : BOOL
*/
@interface SRKAnnouncementInvalid : NSObject

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
 key        : X-SIMU-UserId
 type       : int64
 required   : true
 notes      : X-SIMU-UserId
 rename     : X_SIMU_UserId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *X_SIMU_UserId;

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
 key        : containChild
 type       : boolean
 required   : true
 notes      : containChild
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *containChild;

- (NSDictionary *__nonnull)srk_config;

@end