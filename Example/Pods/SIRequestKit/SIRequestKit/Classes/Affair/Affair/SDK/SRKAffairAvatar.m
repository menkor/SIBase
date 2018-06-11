//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAffairAvatar.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKAffairAvatar.h"

@implementation SRKAffairAvatar

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_RoleId": @"X-SIMU-RoleId",
    };
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"GET",
        @"summary": @"根据事务id获取头像,当不知道盟Id时用",
        @"type": @"string",
        @"param": @[
            @{
                @"paramType": @"header",
                @"key": @"X-SIMU-RoleId",
                @"type": @"int64",
                @"required": @"true",
                @"rename": @"X_SIMU_RoleId",
            },
            @{
                @"paramType": @"path",
                @"key": @"affairId",
                @"type": @"string",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"path": @"/affair/affair/avatar/{affairId}",
        @"category": @"Affair",
    };
}

@end