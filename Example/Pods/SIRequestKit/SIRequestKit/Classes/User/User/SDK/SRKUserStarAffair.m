//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKUserStarAffair.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKUserStarAffair.h"

@implementation SRKUserStarAffair

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
        @"summary": @"关注或者取关事务",
        @"type": @"string",
        @"param": @[
            @{
                @"paramType": @"query",
                @"key": @"affairId",
                @"type": @"int64",
                @"required": @"true",
            },
            @{
                @"paramType": @"query",
                @"key": @"star",
                @"type": @"boolean",
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
        @"path": @"/user/api/star-affair",
        @"category": @"User",
    };
}

@end