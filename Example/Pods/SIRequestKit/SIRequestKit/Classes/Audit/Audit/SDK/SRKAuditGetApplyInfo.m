//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAuditGetApplyInfo.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKAuditGetApplyInfo.h"

@implementation SRKAuditGetApplyInfo

- (NSDictionary *)srk_config {
    return @{
        @"method": @"GET",
        @"summary": @"发送方查看申请审批内容",
        @"type": @"object",
        @"param": @[
            @{
                @"paramType": @"path",
                @"key": @"auditId",
                @"type": @"int64",
                @"required": @"true",
            },
        ],
        @"path": @"/audit/{auditId}/info",
        @"category": @"Audit",
    };
}

@end