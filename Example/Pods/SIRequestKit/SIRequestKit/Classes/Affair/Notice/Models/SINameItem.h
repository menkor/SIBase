//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SINameItem.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SINameItem : NSObject

/**
 format      : int64
 type        : int64_t
 name        : roleId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *roleId;

/**
 format      : string
 type        : NSString
 name        : roleName
*/
@property (nonatomic, copy, nullable) NSString *roleName;

/**
 format      : int64
 type        : int64_t
 name        : userId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *userId;

/**
 format      : string
 type        : NSString
 name        : username
*/
@property (nonatomic, copy, nullable) NSString *username;

@end