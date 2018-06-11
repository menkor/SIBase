//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAnnouncementMemberShowApply.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 path       : /announcement/member/show_apply
 method     : GET
 summary    : 展示申请页面
 type       : string
 response   : NSString
*/
@interface SRKAnnouncementMemberShowApply : NSObject

/**
 paramType  : query
 key        : operationId
 type       : int64
 required   : true
 notes      : operationId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *operationId;

/**
 paramType  : header
 key        : X-SIMU-RoleId
 type       : int64
 required   : true
 notes      : X-SIMU-RoleId
 rename     : X_SIMU_RoleId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *X_SIMU_RoleId;

- (NSDictionary *__nonnull)srk_config;

@end