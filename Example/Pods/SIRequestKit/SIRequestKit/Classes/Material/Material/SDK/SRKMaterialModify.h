//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKMaterialModify.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIMaterialEditForm.h"
#import <Foundation/Foundation.h>

/**
 path       : /material/modify
 method     : POST
 summary    : 修改物资
 type       : boolean
 response   : BOOL
*/
@interface SRKMaterialModify : NSObject

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
 key        : materialId
 type       : int64
 required   : true
 notes      : materialId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *materialId;

/**
 paramType  : body
 key        : form
 type       : MaterialEditForm
 required   : true
 notes      : form
*/
@property (nonatomic, strong, nullable) SIMaterialEditForm *form;

- (NSDictionary *__nonnull)srk_config;

@end