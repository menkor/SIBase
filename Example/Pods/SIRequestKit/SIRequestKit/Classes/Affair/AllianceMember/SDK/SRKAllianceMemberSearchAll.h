//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAllianceMemberSearchAll.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SISearchUserItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /affair/alliance_member/search_all
 method     : GET
 summary    : 搜索全部用户
 type       : SearchUserVO
 response   : SISearchUserItem
*/
@interface SRKAllianceMemberSearchAll : NSObject

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
 key        : keyword
 type       : string
 required   : true
 notes      : keyword
*/
@property (nonatomic, copy, nullable) NSString *keyword;

/**
 The class of response object[s]
 @return [SISearchUserItem class]*/
+ (Class /*SISearchUserItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end