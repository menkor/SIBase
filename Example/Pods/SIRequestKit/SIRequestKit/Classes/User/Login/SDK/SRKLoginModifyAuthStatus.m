//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKLoginModifyAuthStatus.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKLoginModifyAuthStatus.h"

@implementation SRKLoginModifyAuthStatus

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"id_p": @"id",
    };
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"POST",
        @"summary": @"身份认证审核",
        @"type": @"string",
        @"param": @[
            @{
                @"paramType": @"query",
                @"key": @"id",
                @"type": @"string",
                @"required": @"true",
                @"rename": @"id_p",
            },
            @{
                @"paramType": @"query",
                @"key": @"authStatus",
                @"type": @"string",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"path": @"/user/api/external/modify-auth-status",
        @"category": @"Login",
    };
}

@end