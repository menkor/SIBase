//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAffairSimpleTree.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKAffairSimpleTree.h"

@implementation SRKAffairSimpleTree

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_AffairId": @"X-SIMU-AffairId",
        @"X_SIMU_UserId": @"X-SIMU-UserId",
    };
}

/**
 The class of response object[s]
 @return [SIAffairNameItem class]
*/
+ (Class)responseClass {
    return [SIAffairNameItem class];
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"GET",
        @"summary": @"得到事务树",
        @"type": @"AffairNameVO",
        @"param": @[
            @{
                @"paramType": @"header",
                @"key": @"X-SIMU-AffairId",
                @"type": @"int64",
                @"required": @"true",
                @"rename": @"X_SIMU_AffairId",
            },
            @{
                @"paramType": @"header",
                @"key": @"X-SIMU-UserId",
                @"type": @"int64",
                @"required": @"true",
                @"rename": @"X_SIMU_UserId",
            },
            @{
                @"paramType": @"query",
                @"key": @"allianceId",
                @"type": @"int64",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"response": @"SIAffairNameItem",
        @"path": @"/affair/affair/simple_tree",
        @"category": @"Affair",
    };
}

@end