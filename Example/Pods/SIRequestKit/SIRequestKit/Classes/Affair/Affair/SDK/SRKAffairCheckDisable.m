//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAffairCheckDisable.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKAffairCheckDisable.h"

@implementation SRKAffairCheckDisable

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
 @return [SICheckDisableAffairItem class]
*/
+ (Class)responseClass {
    return [SICheckDisableAffairItem class];
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"POST",
        @"summary": @"失效事务前例行检查，检查该事务下是否有子事务和权限",
        @"type": @"CheckDisableAffairVO",
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
        ],
        @"consumes": @"application/json",
        @"response": @"SICheckDisableAffairItem",
        @"path": @"/affair/affair/check_disable",
        @"category": @"Affair",
    };
}

@end