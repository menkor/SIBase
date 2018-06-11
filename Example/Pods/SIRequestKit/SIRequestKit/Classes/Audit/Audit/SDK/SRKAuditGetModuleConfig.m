//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAuditGetModuleConfig.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKAuditGetModuleConfig.h"

@implementation SRKAuditGetModuleConfig

/**
 The class of response object[s]
 @return [SIAuditModuleItem class]
*/
+ (Class)responseClass {
    return [SIAuditModuleItem class];
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"GET",
        @"summary": @"获取配置了审批的模块",
        @"type": @"AuditModuleVO",
        @"param": @[
        ],
        @"response": @"SIAuditModuleItem",
        @"path": @"/audit/config/modules",
        @"category": @"Audit",
    };
}

@end