//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKFundAddRealAccount.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKFundAddRealAccount.h"

@implementation SRKFundAddRealAccount

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
        @"summary": @"添加现实账户",
        @"type": @"string",
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
                @"type": @"AddAccountForm",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"path": @"/web/fund/add_real_account",
        @"category": @"Fund",
    };
}

@end