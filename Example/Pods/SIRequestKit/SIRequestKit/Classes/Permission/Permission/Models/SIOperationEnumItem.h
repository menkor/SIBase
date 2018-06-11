//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SIOperationEnumItem.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIOperationEnumItem : NSObject

/**
 format      : string
 type        : NSString
 name        : name
*/
@property (nonatomic, copy, nullable) NSString *name;

/**
 format      : int32
 type        : int32_t
 name        : code
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *code;

/**
 format      : string
 type        : NSString
 name        : description
*/
@property (nonatomic, copy, nullable) NSString *desc;

/**
 format      : int32
 type        : int32_t
 name        : permissionType
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *permissionType;

/**
 format      : string
 type        : NSString
 name        : resourceType
*/
@property (nonatomic, copy, nullable) NSString *resourceType;

@end