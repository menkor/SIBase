//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SISearchUserItem.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SISearchUserItem : NSObject

/**
 format      : string
 type        : NSString
 name        : avatar
*/
@property (nonatomic, copy, nullable) NSString *avatar;

/**
 format      : string
 type        : NSString
 name        : email
*/
@property (nonatomic, copy, nullable) NSString *email;

/**
 format      : int32
 type        : int32_t
 name        : gender
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *gender;

/**
 format      : int64
 type        : int64_t
 name        : id
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *id_p;

/**
 format      : boolean
 type        : BOOL
 name        : invited
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *invited;

/**
 format      : int32
 type        : int32_t
 name        : matchedType
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *matchedType;

/**
 format      : int64
 type        : int64_t
 name        : memberId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *memberId;

/**
 format      : string
 type        : NSString
 name        : mobile
*/
@property (nonatomic, copy, nullable) NSString *mobile;

/**
 format      : string
 type        : NSString
 name        : name
*/
@property (nonatomic, copy, nullable) NSString *name;

/**
 format      : string
 type        : NSString
 name        : roleTitle
*/
@property (nonatomic, copy, nullable) NSString *roleTitle;

/**
 format      : int64
 type        : int64_t
 name        : rootRoleId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *rootRoleId;

/**
 format      : string
 type        : NSString
 name        : superId
*/
@property (nonatomic, copy, nullable) NSString *superId;

/**
 format      : string
 type        : [NSString]
 name        : tag
*/
@property (nonatomic, strong, nullable) NSArray<NSString *> *tag;

@end