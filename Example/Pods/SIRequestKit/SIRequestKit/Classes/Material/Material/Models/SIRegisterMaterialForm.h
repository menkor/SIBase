//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SIRegisterMaterialForm.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIPairItem.h"
#import <Foundation/Foundation.h>

@interface SIRegisterMaterialForm : NSObject

/**
 format      : Pair«string,string»
 type        : [SIPairItem]
 name        : attribute
 notes       : 品类属性,属性数量限制为0~20,属性长度限制为1~20
*/
@property (nonatomic, strong, nullable) NSArray<SIPairItem *> *attribute;

/**
 format      : string
 type        : NSString
 name        : currency
 notes       : 币种类型
*/
@property (nonatomic, copy, nullable) NSString *currency;

/**
 format      : string
 type        : NSString
 name        : description
 notes       : 物资描述,限制长度0~3000
*/
@property (nonatomic, copy, nullable) NSString *desc;

/**
 format      : string
 type        : NSString
 name        : image
 notes       : 物资图片url,限制长度0~128
*/
@property (nonatomic, copy, nullable) NSString *image;

/**
 format      : string
 type        : NSString
 name        : location
 notes       : 物资所在地
*/
@property (nonatomic, copy, nullable) NSString *location;

/**
 format      : string
 type        : NSString
 name        : name
 notes       : 物资名字,限制长度1~50
*/
@property (nonatomic, copy, nullable) NSString *name;

/**
 format      : string
 type        : NSString
 name        : price
 notes       : 物资价值,可以不填
*/
@property (nonatomic, copy, nullable) NSString *price;

/**
 format      : int32
 type        : int32_t
 name        : publicType
 notes       : 物资公开类型,0 public, 10 private
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *publicType;

/**
 format      : double
 type        : double
 name        : quantity
 notes       : 物资数量
*/
@property (nonatomic, strong, nullable) NSNumber /*double*/ *quantity;

/**
 format      : string
 type        : [NSString]
 name        : tag
 notes       : 标签列表,标签数量限制为0~8,标签长度限制为1~10
*/
@property (nonatomic, strong, nullable) NSArray<NSString *> *tag;

/**
 format      : int32
 type        : int32_t
 name        : type
 notes       : 物资类型
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *type;

/**
 format      : string
 type        : NSString
 name        : unit
 notes       : 物资单位,限制长度1~3
*/
@property (nonatomic, copy, nullable) NSString *unit;

/**
 format      : int64
 type        : int64_t
 name        : warehouseId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *warehouseId;

@end