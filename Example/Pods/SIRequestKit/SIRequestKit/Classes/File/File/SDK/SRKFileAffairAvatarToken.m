//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKFileAffairAvatarToken.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKFileAffairAvatarToken.h"

@implementation SRKFileAffairAvatarToken

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_AffairId": @"X-SIMU-AffairId",
        @"X_SIMU_RoleId": @"X-SIMU-RoleId",
    };
}

/**
 The class of response object[s]
 @return [SISignature class]
*/
+ (Class)responseClass {
    return [SISignature class];
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"POST",
        @"summary": @"获取事务头像上传token",
        @"type": @"Signature",
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
                @"paramType": @"body",
                @"key": @"fileOperation",
                @"type": @"FileOperation",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"response": @"SISignature",
        @"path": @"/file/api/affair-avatar-token",
        @"category": @"File",
    };
}

@end