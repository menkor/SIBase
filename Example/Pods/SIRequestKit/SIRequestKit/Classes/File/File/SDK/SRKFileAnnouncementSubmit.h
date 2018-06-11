//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKFileAnnouncementSubmit.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SISignature.h"
#import "SIFileOperation.h"
#import <Foundation/Foundation.h>

/**
 path       : /file/api/announcement-submit
 method     : POST
 summary    : 获取公告(作业或者发布)提交的上传token
 type       : Signature
 response   : SISignature
*/
@interface SRKFileAnnouncementSubmit : NSObject

/**
 paramType  : body
 key        : fileOperation
 type       : FileOperation
 required   : true
 notes      : fileOperation
*/
@property (nonatomic, strong, nullable) SIFileOperation *fileOperation;

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
 key        : X-SIMU-UserId
 type       : int64
 required   : true
 notes      : X-SIMU-UserId
 rename     : X_SIMU_UserId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *X_SIMU_UserId;

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
 @return [SISignature class]*/
+ (Class /*SISignature*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end