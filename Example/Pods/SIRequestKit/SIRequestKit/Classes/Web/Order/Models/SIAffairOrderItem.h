//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SIAffairOrderItem.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIOrderItem.h"
#import <Foundation/Foundation.h>

@interface SIAffairOrderItem : NSObject

/**
 format      : int64
 type        : int64_t
 name        : id
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *id_p;

/**
 format      : int32
 type        : int32_t
 name        : level
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *level;

/**
 format      : string
 type        : NSString
 name        : name
*/
@property (nonatomic, copy, nullable) NSString *name;

/**
 format      : OrderVO
 type        : [SIOrderItem]
 name        : orders
*/
@property (nonatomic, strong, nullable) NSArray<SIOrderItem *> *orders;

/**
 format      : int64
 type        : int64_t
 name        : parentId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *parentId;

@end