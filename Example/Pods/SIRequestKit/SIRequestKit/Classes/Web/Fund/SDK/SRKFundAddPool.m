//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKFundAddPool.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKFundAddPool.h"

@implementation SRKFundAddPool

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
        @"method": @"POST",
        @"summary": @"添加资金库",
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
            @{
                @"paramType": @"body",
                @"key": @"form",
                @"type": @"AddFundPoolForm",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"path": @"/web/fund/add_fund_pool",
        @"category": @"Fund",
    };
}

@end