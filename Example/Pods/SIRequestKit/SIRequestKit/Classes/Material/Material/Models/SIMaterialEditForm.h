//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SIMaterialEditForm.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIPairItem.h"
#import <Foundation/Foundation.h>

@interface SIMaterialEditForm : NSObject

/**
 format      : Pair«string,string»
 type        : [SIPairItem]
 name        : attribute
*/
@property (nonatomic, strong, nullable) NSArray<SIPairItem *> *attribute;

/**
 format      : string
 type        : NSString
 name        : description
*/
@property (nonatomic, copy, nullable) NSString *desc;

/**
 format      : string
 type        : NSString
 name        : image
*/
@property (nonatomic, copy, nullable) NSString *image;

/**
 format      : string
 type        : NSString
 name        : location
*/
@property (nonatomic, copy, nullable) NSString *location;

/**
 format      : string
 type        : NSString
 name        : name
*/
@property (nonatomic, copy, nullable) NSString *name;

/**
 format      : string
 type        : NSString
 name        : price
*/
@property (nonatomic, copy, nullable) NSString *price;

/**
 format      : int32
 type        : int32_t
 name        : publicType
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *publicType;

/**
 format      : int32
 type        : int32_t
 name        : state
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *state;

/**
 format      : string
 type        : [NSString]
 name        : tags
*/
@property (nonatomic, strong, nullable) NSArray<NSString *> *tags;

@end