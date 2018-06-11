//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKFileSetFileSetDetail.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKFileSetFileSetDetail.h"

@implementation SRKFileSetFileSetDetail

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_AffairId": @"X-SIMU-AffairId",
        @"X_SIMU_RoleId": @"X-SIMU-RoleId",
        @"X_SIMU_ResourceId": @"X-SIMU-ResourceId",
    };
}

/**
 The class of response object[s]
 @return [SIFileSetDetailItem class]
*/
+ (Class)responseClass {
    return [SIFileSetDetailItem class];
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"GET",
        @"summary": @"获取事务文件库详情,用于标题栏",
        @"type": @"FileSetDetailVO",
        @"param": @[
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
            @{
                @"paramType": @"header",
                @"key": @"X-SIMU-ResourceId",
                @"type": @"int64",
                @"required": @"true",
                @"rename": @"X_SIMU_ResourceId",
            },
            @{
                @"paramType": @"query",
                @"key": @"setId",
                @"type": @"int64",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"response": @"SIFileSetDetailItem",
        @"path": @"/file/api/fileSet/detail",
        @"category": @"FileSet",
    };
}

@end