//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKMaterialEntryDelete.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 path       : /material/entry/delete
 method     : DELETE
 summary    : 删除条目
 type       : boolean
 response   : BOOL
*/
@interface SRKMaterialEntryDelete : NSObject

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
 key        : allianceId
 type       : int64
 required   : true
 notes      : allianceId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *allianceId;

/**
 paramType  : query
 key        : entryId
 type       : int64
 required   : true
 notes      : entryId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *entryId;

/**
 paramType  : query
 key        : affectSub
 type       : boolean
 required   : true
 notes      : affectSub
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *affectSub;

- (NSDictionary *__nonnull)srk_config;

@end