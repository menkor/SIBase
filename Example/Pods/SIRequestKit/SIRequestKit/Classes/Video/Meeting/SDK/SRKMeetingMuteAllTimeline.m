//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKMeetingMuteAllTimeline.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKMeetingMuteAllTimeline.h"

@implementation SRKMeetingMuteAllTimeline

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
        @"summary": @"禁言所有人时间轴",
        @"type": @"Null",
        @"param": @[
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
            @{
                @"paramType": @"query",
                @"key": @"roomId",
                @"type": @"int64",
                @"required": @"true",
            },
            @{
                @"paramType": @"query",
                @"key": @"allianceId",
                @"type": @"int64",
                @"required": @"true",
            },
            @{
                @"paramType": @"query",
                @"key": @"operatorRoleId",
                @"type": @"int64",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"path": @"/video/meeting/mute_all_timeline",
        @"category": @"Meeting",
    };
}

@end