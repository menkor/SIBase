//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKMessageUpdateRead.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SRKMessageUpdateRead.h"

@implementation SRKMessageUpdateRead

- (NSDictionary *)srk_config {
    return @{
        @"method": @"POST",
        @"summary": @"根据消息ID更新单个消息",
        @"type": @"boolean",
        @"param": @[
            @{
                @"paramType": @"path",
                @"key": @"noticeId",
                @"type": @"int64",
                @"required": @"true",
            },
        ],
        @"path": @"/msg/api/msg/{noticeId}",
        @"category": @"Message",
    };
}

@end