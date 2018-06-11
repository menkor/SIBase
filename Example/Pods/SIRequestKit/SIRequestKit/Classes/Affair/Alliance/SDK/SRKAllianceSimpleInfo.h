//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAllianceSimpleInfo.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SISimpleAllianceItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /affair/alliance/simple_info
 method     : GET
 summary    : 获取一串盟名称和logo
 type       : SimpleAllianceVO
 response   : SISimpleAllianceItem
*/
@interface SRKAllianceSimpleInfo : NSObject

/**
 paramType  : query
 key        : allianceIds
 type       : string
 required   : true
 notes      : allianceIds
*/
@property (nonatomic, copy, nullable) NSString *allianceIds;

/**
 The class of response object[s]
 @return [SISimpleAllianceItem class]*/
+ (Class /*SISimpleAllianceItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end