//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKMessageBatchUpdateRead.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 path       : /msg/api/msg/{msgType}/{roleId}/updates
 method     : PUT
 summary    : 根据角色ID批量更新某种类型的消息
 type       : boolean
 response   : BOOL
*/
@interface SRKMessageBatchUpdateRead : NSObject

/**
 paramType  : path
 key        : msgType
 type       : int32
 required   : true
 notes      : 消息类型
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *msgType;

/**
 paramType  : path
 key        : roleId
 type       : int64
 required   : true
 notes      : 
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *roleId;

/**
 paramType  : query
 key        : sendTime
 type       : int64
 required   : false
 notes      : 
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *sendTime;

- (NSDictionary *__nonnull)srk_config;

@end