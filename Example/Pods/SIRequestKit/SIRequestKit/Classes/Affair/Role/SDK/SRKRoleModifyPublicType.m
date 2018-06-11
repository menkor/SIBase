//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKRoleModifyPublicType.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKRoleModifyPublicType.h"

@implementation SRKRoleModifyPublicType

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
        @"method": @"GET",
        @"summary": @"修改角色公开性",
        @"type": @"boolean",
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
                @"key": @"X-SIMU-ResourceId",
                @"type": @"int64",
                @"required": @"true",
                @"rename": @"X_SIMU_ResourceId",
            },
            @{
                @"paramType": @"query",
                @"key": @"publicType",
                @"type": @"int32",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"path": @"/affair/role/modify_public_type",
        @"category": @"Role",
    };
}

@end