//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAffairMemberMainRoles.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKAffairMemberMainRoles.h"

@implementation SRKAffairMemberMainRoles

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_RoleId": @"X-SIMU-RoleId",
        @"X_SIMU_AffairId": @"X-SIMU-AffairId",
    };
}

/**
 The class of response object[s]
 @return [SIRoleInfoItem class]
*/
+ (Class)responseClass {
    return [SIRoleInfoItem class];
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"GET",
        @"summary": @"获取某个事务内的所有主角色",
        @"type": @"RoleInfoVO",
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
                @"paramType": @"query",
                @"key": @"state",
                @"type": @"int32",
                @"required": @"false",
            },
            @{
                @"paramType": @"query",
                @"key": @"containChildren",
                @"type": @"boolean",
                @"required": @"false",
            },
        ],
        @"consumes": @"application/json",
        @"response": @"SIRoleInfoItem",
        @"path": @"/affair/affair_member/main_roles",
        @"category": @"AffairMember",
    };
}

@end