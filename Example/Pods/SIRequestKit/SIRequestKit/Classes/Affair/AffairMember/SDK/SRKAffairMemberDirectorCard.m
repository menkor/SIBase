//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAffairMemberDirectorCard.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKAffairMemberDirectorCard.h"

@implementation SRKAffairMemberDirectorCard

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
 @return [SIAffairRoleCard class]
*/
+ (Class)responseClass {
    return [SIAffairRoleCard class];
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"GET",
        @"summary": @"获取某个事务责任人的角色卡片",
        @"type": @"AffairRoleCard",
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
                @"key": @"targetAffairId",
                @"type": @"int64",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"response": @"SIAffairRoleCard",
        @"path": @"/affair/affair_member/director_card",
        @"category": @"AffairMember",
    };
}

@end