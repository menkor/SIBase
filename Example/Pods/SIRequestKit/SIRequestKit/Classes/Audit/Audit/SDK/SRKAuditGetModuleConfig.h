//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAuditGetModuleConfig.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIAuditModuleItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /audit/config/modules
 method     : GET
 summary    : 获取配置了审批的模块
 type       : AuditModuleVO
 response   : SIAuditModuleItem
*/
@interface SRKAuditGetModuleConfig : NSObject

/**
 The class of response object[s]
 @return [SIAuditModuleItem class]*/
+ (Class /*SIAuditModuleItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end