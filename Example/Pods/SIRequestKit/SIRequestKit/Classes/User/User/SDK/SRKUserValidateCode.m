//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKUserValidateCode.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKUserValidateCode.h"

@implementation SRKUserValidateCode

- (NSDictionary *)srk_config {
    return @{
        @"method": @"GET",
        @"summary": @"获取图片验证码",
        @"type": @"string",
        @"param": @[
            @{
                @"paramType": @"query",
                @"key": @"token",
                @"type": @"string",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"path": @"/user/api/external/validate-code",
        @"category": @"User",
    };
}

@end