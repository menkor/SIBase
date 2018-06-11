//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKUserChangeMobileOrEmail.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKUserChangeMobileOrEmail.h"

@implementation SRKUserChangeMobileOrEmail

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_UserId": @"X-SIMU-UserId",
    };
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"POST",
        @"summary": @"修改手机或者邮箱号码",
        @"type": @"SimpleResponse",
        @"param": @[
            @{
                @"paramType": @"query",
                @"key": @"account",
                @"type": @"string",
                @"required": @"true",
            },
            @{
                @"paramType": @"query",
                @"key": @"verifyCode",
                @"type": @"string",
                @"required": @"true",
            },
            @{
                @"paramType": @"header",
                @"key": @"X-SIMU-UserId",
                @"type": @"string",
                @"required": @"true",
                @"rename": @"X_SIMU_UserId",
            },
        ],
        @"consumes": @"application/json",
        @"path": @"/user/api/change-mobile-or-email",
        @"category": @"User",
    };
}

@end