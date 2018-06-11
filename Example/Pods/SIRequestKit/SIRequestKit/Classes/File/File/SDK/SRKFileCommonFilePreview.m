//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKFileCommonFilePreview.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKFileCommonFilePreview.h"

@implementation SRKFileCommonFilePreview

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_AffairId": @"X-SIMU-AffairId",
        @"X_SIMU_RoleId": @"X-SIMU-RoleId",
    };
}

/**
 The class of response object[s]
 @return [SISignature class]
*/
+ (Class)responseClass {
    return [SISignature class];
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"GET",
        @"summary": @"文件通用预览token",
        @"type": @"Signature",
        @"param": @[
            @{
                @"paramType": @"query",
                @"key": @"path",
                @"type": @"string",
                @"required": @"true",
            },
            @{
                @"paramType": @"header",
                @"key": @"X-SIMU-AffairId",
                @"type": @"int64",
                @"required": @"true",
                @"rename": @"X_SIMU_AffairId",
            },
            @{
                @"paramType": @"header",
                @"key": @"X-SIMU-RoleId",
                @"type": @"int64",
                @"required": @"true",
                @"rename": @"X_SIMU_RoleId",
            },
        ],
        @"consumes": @"application/json",
        @"response": @"SISignature",
        @"path": @"/file/api/common-file-preview",
        @"category": @"File",
    };
}

@end