//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKUserValidUsername.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 path       : /user/api/external/valid-username
 method     : POST
 summary    : 验证用户名
 type       : boolean
 response   : BOOL
*/
@interface SRKUserValidUsername : NSObject

/**
 paramType  : query
 key        : username
 type       : string
 required   : true
 notes      : username
*/
@property (nonatomic, copy, nullable) NSString *username;

- (NSDictionary *__nonnull)srk_config;

@end