//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKMaterialWarehouseOverview.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIMaterialOverviewItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /material/warehouse/overview
 method     : GET
 summary    : 获取物资库列总览(管理员列表视角)
 type       : MaterialOverviewVO
 response   : SIMaterialOverviewItem
*/
@interface SRKMaterialWarehouseOverview : NSObject

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
 @return [SIMaterialOverviewItem class]*/
+ (Class /*SIMaterialOverviewItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end