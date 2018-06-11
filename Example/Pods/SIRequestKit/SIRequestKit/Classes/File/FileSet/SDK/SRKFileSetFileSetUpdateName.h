//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKFileSetFileSetUpdateName.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIAddFileSetItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /file/api/fileSet/updateName
 method     : POST
 summary    : 修改事务文件库名称
 type       : SimpleResponse
 response   : NSString
*/
@interface SRKFileSetFileSetUpdateName : NSObject

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
 paramType  : body
 key        : newFileSetVO
 type       : AddFileSetVO
 required   : true
 notes      : newFileSetVO
 rename     : fileSetVO
*/
@property (nonatomic, strong, nullable) SIAddFileSetItem *fileSetVO;

- (NSDictionary *__nonnull)srk_config;

@end