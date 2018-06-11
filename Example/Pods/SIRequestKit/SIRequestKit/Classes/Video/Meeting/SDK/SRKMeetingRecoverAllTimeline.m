//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKMeetingRecoverAllTimeline.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKMeetingRecoverAllTimeline.h"

@implementation SRKMeetingRecoverAllTimeline

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
        @"summary": @"全员禁言恢复时间轴",
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
        ],
        @"consumes": @"application/json",
        @"path": @"/video/meeting/recover_all_timeline",
        @"category": @"Meeting",
    };
}

@end