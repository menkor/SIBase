//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKFileAddFolders.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIAddFolderItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /file/api/add-folders
 method     : POST
 summary    : 批量添加带路径的文件夹列表
 type       : AddFolderVO
 response   : SIAddFolderItem
*/
@interface SRKFileAddFolders : NSObject

/**
 paramType  : query
 key        : folderId
 type       : int64
 required   : true
 notes      : folderId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *folderId;

/**
 paramType  : query
 key        : paths
 type       : array
 required   : true
 notes      : paths
*/
@property (nonatomic, strong, nullable) NSArray<NSString *> *paths;

/**
 paramType  : query
 key        : fileSetId
 type       : int64
 required   : false
 notes      : fileSetId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *fileSetId;

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
 @return [SIAddFolderItem class]*/
+ (Class /*SIAddFolderItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end