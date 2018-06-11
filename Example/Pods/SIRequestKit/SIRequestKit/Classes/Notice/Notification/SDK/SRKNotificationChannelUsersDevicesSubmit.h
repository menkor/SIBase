//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKNotificationChannelUsersDevicesSubmit.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIMobileRequestInfo.h"
#import <Foundation/Foundation.h>

/**
 path       : /notice/external/notification/channel/users/{userId}/devices/{objectId}
 method     : POST
 summary    : delete local user channel.
 type       : boolean
 response   : BOOL
*/
@interface SRKNotificationChannelUsersDevicesSubmit : NSObject

/**
 paramType  : body
 key        : body
 type       : MobileRequestInfo
 required   : false
 notes      : 
*/
@property (nonatomic, strong, nullable) SIMobileRequestInfo *body;

/**
 paramType  : path
 key        : userId
 type       : int64
 required   : true
 notes      : 
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *userId;

/**
 paramType  : path
 key        : objectId
 type       : string
 required   : true
 notes      : 
*/
@property (nonatomic, copy, nullable) NSString *objectId;

- (NSDictionary *__nonnull)srk_config;

@end