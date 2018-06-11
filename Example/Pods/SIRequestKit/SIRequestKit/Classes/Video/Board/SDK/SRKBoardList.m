//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKBoardList.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKBoardList.h"

@implementation SRKBoardList

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
        @"method": @"GET",
        @"summary": @"得到房间内白板列表",
        @"type": @"array",
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
        ],
        @"consumes": @"application/json",
        @"path": @"/video/board/list",
        @"category": @"Board",
    };
}

@end