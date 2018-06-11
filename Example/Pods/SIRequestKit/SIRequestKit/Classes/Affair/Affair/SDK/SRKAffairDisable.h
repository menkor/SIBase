//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAffairDisable.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 path       : /affair/affair/disable
 method     : POST
 summary    : 失效一个事务,调用前必须先确认
 type       : boolean
 response   : BOOL
*/
@interface SRKAffairDisable : NSObject

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

- (NSDictionary *__nonnull)srk_config;

@end