//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKFileAddFolders.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKFileAddFolders.h"

@implementation SRKFileAddFolders

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_ResourceId": @"X-SIMU-ResourceId",
        @"X_SIMU_RoleId": @"X-SIMU-RoleId",
        @"X_SIMU_AffairId": @"X-SIMU-AffairId",
    };
}

/**
 The class of response object[s]
 @return [SIAddFolderItem class]
*/
+ (Class)responseClass {
    return [SIAddFolderItem class];
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"POST",
        @"summary": @"批量添加带路径的文件夹列表",
        @"type": @"AddFolderVO",
        @"param": @[
            @{
                @"paramType": @"query",
                @"key": @"folderId",
                @"type": @"int64",
                @"required": @"true",
            },
            @{
                @"paramType": @"query",
                @"key": @"paths",
                @"type": @"array",
                @"required": @"true",
            },
            @{
                @"paramType": @"query",
                @"key": @"fileSetId",
                @"type": @"int64",
                @"required": @"false",
            },
            @{
                @"paramType": @"header",
                @"key": @"X-SIMU-ResourceId",
                @"type": @"int64",
                @"required": @"true",
                @"rename": @"X_SIMU_ResourceId",
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
        @"response": @"SIAddFolderItem",
        @"path": @"/file/api/add-folders",
        @"category": @"File",
    };
}

@end