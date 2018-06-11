//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAnnouncementShipAddTask.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 path       : /announcement/ship/add_task
 method     : POST
 summary    : 添加关联工作
 type       : boolean
 response   : BOOL
*/
@interface SRKAnnouncementShipAddTask : NSObject

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
 paramType  : query
 key        : announcementTaskId
 type       : int64
 required   : true
 notes      : announcementTaskId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *announcementTaskId;

/**
 paramType  : query
 key        : shipAnnouncementTaskId
 type       : int64
 required   : true
 notes      : shipAnnouncementTaskId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *shipAnnouncementTaskId;

/**
 paramType  : query
 key        : type
 type       : int32
 required   : true
 notes      : type
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *type;

- (NSDictionary *__nonnull)srk_config;

@end