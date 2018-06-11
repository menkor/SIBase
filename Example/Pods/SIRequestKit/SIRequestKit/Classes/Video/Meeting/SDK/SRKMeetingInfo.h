//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKMeetingInfo.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIMeetingRoomEntity.h"
#import <Foundation/Foundation.h>

/**
 path       : /video/meeting/info
 method     : GET
 summary    : 获取房间信息
 type       : MeetingRoomEntity
 response   : SIMeetingRoomEntity
*/
@interface SRKMeetingInfo : NSObject

/**
 paramType  : query
 key        : roomId
 type       : int64
 required   : true
 notes      : roomId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *roomId;

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
 @return [SIMeetingRoomEntity class]*/
+ (Class /*SIMeetingRoomEntity*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end