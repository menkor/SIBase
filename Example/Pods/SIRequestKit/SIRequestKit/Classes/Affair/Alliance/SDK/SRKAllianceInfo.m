//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAllianceInfo.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKAllianceInfo.h"

@implementation SRKAllianceInfo

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
 @return [SIAlliancePublicInfoItem class]
*/
+ (Class)responseClass {
    return [SIAlliancePublicInfoItem class];
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"GET",
        @"summary": @"展示盟信息",
        @"type": @"AlliancePublicInfoVO",
        @"param": @[
            @{
                @"paramType": @"query",
                @"key": @"allianceId",
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
        ],
        @"consumes": @"application/json",
        @"response": @"SIAlliancePublicInfoItem",
        @"path": @"/affair/alliance/alliance_info",
        @"category": @"Alliance",
    };
}

@end