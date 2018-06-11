//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKMeetingRemind.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKMeetingRemind.h"

@implementation SRKMeetingRemind

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_RoleId": @"X-SIMU-RoleId",
        @"X_SIMU_AffairId": @"X-SIMU-AffairId",
    };
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"POST",
        @"summary": @"提醒人加入",
        @"type": @"Null",
        @"param": @[
            @{
                @"paramType": @"body",
                @"key": @"form",
                @"type": @"InviteToMeetingForm",
                @"required": @"true",
            },
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
        @"path": @"/video/meeting/remind",
        @"category": @"Meeting",
    };
}

@end