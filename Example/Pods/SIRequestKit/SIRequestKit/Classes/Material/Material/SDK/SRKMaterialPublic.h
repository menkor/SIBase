//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKMaterialPublic.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIMaterialItemItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /material/public
 method     : GET
 summary    : 获取公开的物资
 type       : MaterialItemVO
 response   : SIMaterialItemItem
*/
@interface SRKMaterialPublic : NSObject

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
 @return [SIMaterialItemItem class]*/
+ (Class /*SIMaterialItemItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end