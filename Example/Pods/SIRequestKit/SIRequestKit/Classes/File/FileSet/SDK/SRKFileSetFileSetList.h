//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKFileSetFileSetList.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIFileSetItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /file/api/fileSet/list
 method     : GET
 summary    : 获取事务文件库列表
 type       : FileSetVO
 response   : SIFileSetItem
*/
@interface SRKFileSetFileSetList : NSObject

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
 The class of response object[s]
 @return [SIFileSetItem class]*/
+ (Class /*SIFileSetItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end