//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKFundAffairPoolTree.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIFundAccountPoolTreeItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /web/fund/affair_fund_pool_tree
 method     : GET
 summary    : 获取资金库(管理员视角)
 type       : FundAccountPoolTreeVO
 response   : SIFundAccountPoolTreeItem
*/
@interface SRKFundAffairPoolTree : NSObject

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
 key        : isContainChild
 type       : boolean
 required   : true
 notes      : isContainChild
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *isContainChild;

/**
 The class of response object[s]
 @return [SIFundAccountPoolTreeItem class]*/
+ (Class /*SIFundAccountPoolTreeItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end