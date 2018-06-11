//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAffairSearchTags.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKAffairSearchTags.h"

@implementation SRKAffairSearchTags

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_UserId": @"X-SIMU-UserId",
        @"X_SIMU_RoleId": @"X-SIMU-RoleId",
        @"X_SIMU_AffairId": @"X-SIMU-AffairId",
    };
}

/**
 The class of response object[s]
 @return [SIAffairListItem class]
*/
+ (Class)responseClass {
    return [SIAffairListItem class];
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"GET",
        @"summary": @"通过标签搜索事务",
        @"type": @"AffairListVO",
        @"param": @[
            @{
                @"paramType": @"header",
                @"key": @"X-SIMU-UserId",
                @"type": @"int64",
                @"required": @"true",
                @"rename": @"X_SIMU_UserId",
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
                @"key": @"X-SIMU-AffairId",
                @"type": @"int64",
                @"required": @"true",
                @"rename": @"X_SIMU_AffairId",
            },
            @{
                @"paramType": @"query",
                @"key": @"content",
                @"type": @"string",
                @"required": @"true",
            },
            @{
                @"paramType": @"query",
                @"key": @"page",
                @"type": @"int32",
                @"required": @"true",
            },
            @{
                @"paramType": @"query",
                @"key": @"size",
                @"type": @"int32",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"response": @"SIAffairListItem",
        @"path": @"/affair/affair/search_tags",
        @"category": @"Affair",
    };
}

@end