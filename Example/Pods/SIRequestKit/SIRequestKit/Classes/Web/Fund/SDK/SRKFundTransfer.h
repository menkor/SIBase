//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKFundTransfer.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIFundTransferItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /web/fund/transfer
 method     : GET
 summary    : 获取角色的资金转移明细
 type       : FundTransferVO
 response   : SIFundTransferItem
*/
@interface SRKFundTransfer : NSObject

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
 paramType  : query
 key        : currency
 type       : string
 required   : true
 notes      : currency
*/
@property (nonatomic, copy, nullable) NSString *currency;

/**
 paramType  : query
 key        : ownerId
 type       : int64
 required   : true
 notes      : ownerId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *ownerId;

/**
 paramType  : query
 key        : poolId
 type       : int64
 required   : true
 notes      : poolId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *poolId;

/**
 The class of response object[s]
 @return [SIFundTransferItem class]*/
+ (Class /*SIFundTransferItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end