//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAffairRecoverAffair.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKAffairRecoverAffair.h"

@implementation SRKAffairRecoverAffair

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_AffairId": @"X-SIMU-AffairId",
        @"X_SIMU_RoleId": @"X-SIMU-RoleId",
    };
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"GET",
        @"summary": @"恢复事务",
        @"type": @"boolean",
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
        ],
        @"consumes": @"application/json",
        @"path": @"/affair/affair/recover_affair",
        @"category": @"Affair",
    };
}

@end