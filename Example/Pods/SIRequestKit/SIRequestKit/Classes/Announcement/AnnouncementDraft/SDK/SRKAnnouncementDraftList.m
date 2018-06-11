//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAnnouncementDraftList.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKAnnouncementDraftList.h"

@implementation SRKAnnouncementDraftList

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_RoleId": @"X-SIMU-RoleId",
        @"X_SIMU_AffairId": @"X-SIMU-AffairId",
    };
}

/**
 The class of response object[s]
 @return [SISimpleDraftIdItem class]
*/
+ (Class)responseClass {
    return [SISimpleDraftIdItem class];
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"GET",
        @"summary": @"得到某个人的公告草稿列表",
        @"type": @"SimpleDraftIdVO",
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
        ],
        @"consumes": @"application/json",
        @"response": @"SISimpleDraftIdItem",
        @"path": @"/announcement/draft/list",
        @"category": @"AnnouncementDraft",
    };
}

@end