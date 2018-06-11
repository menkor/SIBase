//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAffairDirectChildren.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIAffairEntity.h"
#import <Foundation/Foundation.h>

/**
 path       : /affair/affair/direct_children
 method     : GET
 summary    : 获取直接子事务
 type       : AffairEntity
 response   : SIAffairEntity
*/
@interface SRKAffairDirectChildren : NSObject

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
 @return [SIAffairEntity class]*/
+ (Class /*SIAffairEntity*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end