//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKUserVerifySuperid.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKUserVerifySuperid.h"

@implementation SRKUserVerifySuperid

- (NSDictionary *)srk_config {
    return @{
        @"method": @"GET",
        @"summary": @"获取SuperId的合法性",
        @"type": @"string",
        @"param": @[
            @{
                @"paramType": @"query",
                @"key": @"superid",
                @"type": @"string",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"path": @"/user/api/verify-superid",
        @"category": @"User",
    };
}

@end