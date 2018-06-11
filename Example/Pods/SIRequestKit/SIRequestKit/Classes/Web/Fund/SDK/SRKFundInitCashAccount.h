//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKFundInitCashAccount.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 path       : /web/fund/init_cash_account
 method     : POST
 summary    : 初始化现金账户
 type       : boolean
 response   : BOOL
*/
@interface SRKFundInitCashAccount : NSObject

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
 key        : accountId
 type       : int64
 required   : true
 notes      : accountId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *accountId;

/**
 paramType  : query
 key        : amount
 type       : string
 required   : true
 notes      : amount
*/
@property (nonatomic, copy, nullable) NSString *amount;

- (NSDictionary *__nonnull)srk_config;

@end