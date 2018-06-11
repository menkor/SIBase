//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SIAffairFundPoolItem.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIFundPoolCurrencyItemItem.h"
#import "SIFundPoolOwnerRoleItem.h"
#import <Foundation/Foundation.h>

@interface SIAffairFundPoolItem : NSObject

/**
 format      : int64
 type        : int64_t
 name        : affairId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *affairId;

/**
 format      : double
 type        : double
 name        : createTime
*/
@property (nonatomic, strong, nullable) NSNumber /*double*/ *createTime;

/**
 format      : FundPoolCurrencyItemVO
 type        : [SIFundPoolCurrencyItemItem]
 name        : currencyList
*/
@property (nonatomic, strong, nullable) NSArray<SIFundPoolCurrencyItemItem *> *currencyList;

/**
 format      : string
 type        : NSString
 name        : logo
*/
@property (nonatomic, copy, nullable) NSString *logo;

/**
 format      : string
 type        : NSString
 name        : name
*/
@property (nonatomic, copy, nullable) NSString *name;

/**
 format      : int64
 type        : int64_t
 name        : poolId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *poolId;

/**
 format      : int32
 type        : int32_t
 name        : publicType
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *publicType;

/**
 format      : int64
 type        : int64_t
 name        : roleId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *roleId;

/**
 format      : FundPoolOwnerRoleVO
 type        : [SIFundPoolOwnerRoleItem]
 name        : roleVOs
 notes       : 负责人列表
*/
@property (nonatomic, strong, nullable) NSArray<SIFundPoolOwnerRoleItem *> *roleVOs;

/**
 format      : int32
 type        : int32_t
 name        : type
 notes       : 这个是分别是角色库还是公共库,1是角色库,2是公共库
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *type;

@end