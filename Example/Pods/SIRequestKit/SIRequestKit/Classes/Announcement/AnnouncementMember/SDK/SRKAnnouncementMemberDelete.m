//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAnnouncementMemberDelete.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKAnnouncementMemberDelete.h"

@implementation SRKAnnouncementMemberDelete

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_RoleId": @"X-SIMU-RoleId",
        @"X_SIMU_AffairId": @"X-SIMU-AffairId",
        @"X_SIMU_ResourceId": @"X-SIMU-ResourceId",
    };
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"POST",
        @"summary": @"移除成员",
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
                @"key": @"roleId",
                @"type": @"int64",
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
                @"paramType": @"query",
                @"key": @"type",
                @"type": @"int32",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"path": @"/announcement/member/delete",
        @"category": @"AnnouncementMember",
    };
}

@end