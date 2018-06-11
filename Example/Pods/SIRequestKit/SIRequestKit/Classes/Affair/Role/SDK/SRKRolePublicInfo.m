//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKRolePublicInfo.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKRolePublicInfo.h"

@implementation SRKRolePublicInfo

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_RoleId": @"X-SIMU-RoleId",
        @"X_SIMU_AffairId": @"X-SIMU-AffairId",
        @"X_SIMU_UserId": @"X-SIMU-UserId",
    };
}

/**
 The class of response object[s]
 @return [SIUserRolePublicInfoItem class]
*/
+ (Class)responseClass {
    return [SIUserRolePublicInfoItem class];
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"GET",
        @"summary": @"得到userId的公开角色信息",
        @"type": @"UserRolePublicInfoVO",
        @"param": @[
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
                @"key": @"X-SIMU-UserId",
                @"type": @"int64",
                @"required": @"true",
                @"rename": @"X_SIMU_UserId",
            },
            @{
                @"paramType": @"query",
                @"key": @"targetUserId",
                @"type": @"int64",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"response": @"SIUserRolePublicInfoItem",
        @"path": @"/affair/role/public_info",
        @"category": @"Role",
    };
}

@end