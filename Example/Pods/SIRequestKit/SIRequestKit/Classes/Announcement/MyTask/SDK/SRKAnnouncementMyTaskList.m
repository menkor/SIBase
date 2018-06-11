//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAnnouncementMyTaskList.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKAnnouncementMyTaskList.h"

@implementation SRKAnnouncementMyTaskList

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_UserId": @"X-SIMU-UserId",
    };
}

/**
 The class of response object[s]
 @return [SIMyTaskItem class]
*/
+ (Class)responseClass {
    return [SIMyTaskItem class];
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"GET",
        @"summary": @"展示我的任务列表",
        @"type": @"MyTaskVO",
        @"param": @[
            @{
                @"paramType": @"header",
                @"key": @"X-SIMU-UserId",
                @"type": @"int64",
                @"required": @"true",
                @"rename": @"X_SIMU_UserId",
            },
            @{
                @"paramType": @"query",
                @"key": @"state",
                @"type": @"int32",
                @"required": @"true",
            },
            @{
                @"paramType": @"query",
                @"key": @"type",
                @"type": @"int32",
                @"required": @"true",
            },
            @{
                @"paramType": @"query",
                @"key": @"pageNumber",
                @"type": @"int32",
                @"required": @"true",
            },
            @{
                @"paramType": @"query",
                @"key": @"pageSize",
                @"type": @"int32",
                @"required": @"true",
            },
            @{
                @"paramType": @"query",
                @"key": @"keyWord",
                @"type": @"string",
                @"required": @"true",
            },
            @{
                @"paramType": @"query",
                @"key": @"needUpdateNew",
                @"type": @"boolean",
                @"required": @"false",
            },
        ],
        @"consumes": @"application/json",
        @"response": @"SIMyTaskItem",
        @"path": @"/announcement/myTask/list",
        @"category": @"MyTask",
    };
}

@end