//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAllianceSimpleInfo.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKAllianceSimpleInfo.h"

@implementation SRKAllianceSimpleInfo

/**
 The class of response object[s]
 @return [SISimpleAllianceItem class]
*/
+ (Class)responseClass {
    return [SISimpleAllianceItem class];
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"GET",
        @"summary": @"获取一串盟名称和logo",
        @"type": @"SimpleAllianceVO",
        @"param": @[
            @{
                @"paramType": @"query",
                @"key": @"allianceIds",
                @"type": @"string",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"response": @"SISimpleAllianceItem",
        @"path": @"/affair/alliance/simple_info",
        @"category": @"Alliance",
    };
}

@end