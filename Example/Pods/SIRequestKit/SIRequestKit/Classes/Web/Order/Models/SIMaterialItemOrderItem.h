//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SIMaterialItemOrderItem.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIMaterialOrderStateItem.h"
#import <Foundation/Foundation.h>

@interface SIMaterialItemOrderItem : NSObject

/**
 format      : string
 type        : NSString
 name        : avatar
*/
@property (nonatomic, copy, nullable) NSString *avatar;

/**
 format      : string
 type        : NSString
 name        : currency
*/
@property (nonatomic, copy, nullable) NSString *currency;

/**
 format      : int64
 type        : int64_t
 name        : materialId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *materialId;

/**
 format      : string
 type        : NSString
 name        : name
*/
@property (nonatomic, copy, nullable) NSString *name;

/**
 format      : double
 type        : double
 name        : price
*/
@property (nonatomic, strong, nullable) NSNumber /*double*/ *price;

/**
 format      : double
 type        : double
 name        : quantity
*/
@property (nonatomic, strong, nullable) NSNumber /*double*/ *quantity;

/**
 format      : double
 type        : double
 name        : remain
*/
@property (nonatomic, strong, nullable) NSNumber /*double*/ *remain;

/**
 format      : MaterialOrderStateVO
 type        : [SIMaterialOrderStateItem]
 name        : states
*/
@property (nonatomic, strong, nullable) NSArray<SIMaterialOrderStateItem *> *states;

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