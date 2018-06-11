//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKOrderRejectFund.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 path       : /web/order/reject_fund
 method     : POST
 summary    : 拒绝资金交易请求
 type       : boolean
 response   : BOOL
*/
@interface SRKOrderRejectFund : NSObject

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
 key        : orderId
 type       : int64
 required   : true
 notes      : orderId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *orderId;

/**
 paramType  : query
 key        : reason
 type       : string
 required   : true
 notes      : reason
*/
@property (nonatomic, copy, nullable) NSString *reason;

/**
 paramType  : query
 key        : msgId
 type       : int64
 required   : false
 notes      : msgId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *msgId;

/**
 paramType  : query
 key        : chatMsgId
 type       : string
 required   : false
 notes      : chatMsgId
*/
@property (nonatomic, copy, nullable) NSString *chatMsgId;

- (NSDictionary *__nonnull)srk_config;

@end