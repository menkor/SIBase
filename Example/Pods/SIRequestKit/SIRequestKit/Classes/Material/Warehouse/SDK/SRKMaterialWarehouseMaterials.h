//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKMaterialWarehouseMaterials.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIMaterialItemItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /material/warehouse/materials
 method     : GET
 summary    : 获取特定物资库物资列表
 type       : MaterialItemVO
 response   : SIMaterialItemItem
*/
@interface SRKMaterialWarehouseMaterials : NSObject

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
 key        : warehouseId
 type       : int64
 required   : true
 notes      : warehouseId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *warehouseId;

/**
 The class of response object[s]
 @return [SIMaterialItemItem class]*/
+ (Class /*SIMaterialItemItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end