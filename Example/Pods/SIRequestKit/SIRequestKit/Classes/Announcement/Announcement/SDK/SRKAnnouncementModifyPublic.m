//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAnnouncementModifyPublic.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKAnnouncementModifyPublic.h"

@implementation SRKAnnouncementModifyPublic

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_RoleId": @"X-SIMU-RoleId",
        @"X_SIMU_AffairId": @"X-SIMU-AffairId",
        @"X_SIMU_ResourceId": @"X-SIMU-ResourceId",
        @"X_SIMU_UserId": @"X-SIMU-UserId",
    };
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"POST",
        @"summary": @"修改公告公开性",
        @"type": @"Null",
        @"param": @[
            @{
                @"paramType": @"query",
                @"key": @"announcementId",
                @"type": @"int64",
                @"required": @"true",
            },
            @{
                @"paramType": @"query",
                @"key": @"publicType",
                @"type": @"int32",
                @"required": @"true",
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
                @"paramType": @"header",
                @"key": @"X-SIMU-ResourceId",
                @"type": @"int64",
                @"required": @"true",
                @"rename": @"X_SIMU_ResourceId",
            },
            @{
                @"paramType": @"header",
                @"key": @"X-SIMU-UserId",
                @"type": @"int64",
                @"required": @"true",
                @"rename": @"X_SIMU_UserId",
            },
        ],
        @"consumes": @"application/json",
        @"path": @"/announcement/modify_public",
        @"category": @"Announcement",
    };
}

@end