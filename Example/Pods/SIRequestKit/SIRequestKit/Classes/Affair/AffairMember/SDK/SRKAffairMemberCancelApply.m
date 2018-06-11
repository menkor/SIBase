//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAffairMemberCancelApply.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKAffairMemberCancelApply.h"

@implementation SRKAffairMemberCancelApply

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"X_SIMU_UserId": @"X-SIMU-UserId",
        @"X_SIMU_AffairId": @"X-SIMU-AffairId",
        @"X_SIMU_RoleId": @"X-SIMU-RoleId",
    };
}

- (NSDictionary *)srk_config {
    return @{
        @"method": @"POST",
        @"summary": @"取消申请加入事务",
        @"type": @"int32",
        @"param": @[
            @{
                @"paramType": @"header",
                @"key": @"X-SIMU-UserId",
                @"type": @"int64",
                @"required": @"true",
                @"rename": @"X_SIMU_UserId",
            },
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
                @"paramType": @"query",
                @"key": @"targetAffairId",
                @"type": @"int64",
                @"required": @"true",
            },
        ],
        @"consumes": @"application/json",
        @"path": @"/affair/affair_member/cancel_apply",
        @"category": @"AffairMember",
    };
}

@end