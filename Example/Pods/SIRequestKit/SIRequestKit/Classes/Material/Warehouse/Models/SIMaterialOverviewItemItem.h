//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SIMaterialOverviewItemItem.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIMaterialOverviewItemItem : NSObject

/**
 format      : int64
 type        : int64_t
 name        : id
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *id_p;

/**
 format      : double
 type        : double
 name        : locked
*/
@property (nonatomic, strong, nullable) NSNumber /*double*/ *locked;

/**
 format      : string
 type        : NSString
 name        : name
*/
@property (nonatomic, copy, nullable) NSString *name;

/**
 format      : double
 type        : double
 name        : quantity
*/
@property (nonatomic, strong, nullable) NSNumber /*double*/ *quantity;

/**
 format      : int32
 type        : int32_t
 name        : type
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *type;

/**
 format      : string
 type        : NSString
 name        : uniqueCode
*/
@property (nonatomic, copy, nullable) NSString *uniqueCode;

/**
 format      : string
 type        : NSString
 name        : unit
*/
@property (nonatomic, copy, nullable) NSString *unit;

/**
 format      : int64
 type        : int64_t
 name        : warehouseId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *warehouseId;

@end