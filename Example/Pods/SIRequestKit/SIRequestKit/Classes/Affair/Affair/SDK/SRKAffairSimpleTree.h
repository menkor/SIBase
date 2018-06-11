//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAffairSimpleTree.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIAffairNameItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /affair/affair/simple_tree
 method     : GET
 summary    : 得到事务树
 type       : AffairNameVO
 response   : SIAffairNameItem
*/
@interface SRKAffairSimpleTree : NSObject

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
 key        : X-SIMU-UserId
 type       : int64
 required   : true
 notes      : X-SIMU-UserId
 rename     : X_SIMU_UserId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *X_SIMU_UserId;

/**
 paramType  : query
 key        : allianceId
 type       : int64
 required   : true
 notes      : allianceId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *allianceId;

/**
 The class of response object[s]
 @return [SIAffairNameItem class]*/
+ (Class /*SIAffairNameItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end