//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKFileSetFileSetAdd.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKFileSetFileSetAdd.h"

@implementation SRKFileSetFileSetAdd

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_AffairId": @"X-SIMU-AffairId",
        @"X_SIMU_RoleId": @"X-SIMU-RoleId",
        @"X_SIMU_UserId": @"X-SIMU-UserId",
    };
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"POST",
        @"summary": @"添加事务文件库",
        @"type": @"SimpleResponse",
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
                @"key": @"X-SIMU-RoleId",
                @"type": @"int64",
                @"required": @"true",
                @"rename": @"X_SIMU_RoleId",
            },
            @{
                @"paramType": @"header",
                @"key": @"X-SIMU-UserId",
                @"type": @"int64",
                @"required": @"true",
                @"rename": @"X_SIMU_UserId",
            },
            @{
                @"paramType": @"body",
                @"key": @"addFileSetVO",
                @"type": @"AddFileSetVO",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"path": @"/file/api/fileSet/add",
        @"category": @"FileSet",
    };
}

@end