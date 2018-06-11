//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAnnouncementMove.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 path       : /announcement/move
 method     : POST
 summary    : 移动发布的位置
 type       : boolean
 response   : BOOL
*/
@interface SRKAnnouncementMove : NSObject

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
 paramType  : query
 key        : toBeMovedAnnouncementId
 type       : int64
 required   : true
 notes      : toBeMovedAnnouncementId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *toBeMovedAnnouncementId;

/**
 paramType  : query
 key        : announcementId
 type       : int64
 required   : true
 notes      : announcementId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *announcementId;

- (NSDictionary *__nonnull)srk_config;

@end