//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SISearchAffairMemberConditions.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SISearchAffairMemberConditions : NSObject

/**
 format      : int32
 type        : int32_t
 name        : count
 notes       : 每页显示数量，10-100之间
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *count;

/**
 format      : boolean
 type        : BOOL
 name        : includeSubAffair
 notes       : 是否包含子事务，不填默认不包含
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *includeSubAffair;

/**
 format      : boolean
 type        : BOOL
 name        : isReverseSort
 notes       : 是否反序排序，不填默认为正序
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *isReverseSort;

/**
 format      : string
 type        : NSString
 name        : key
 notes       : 成员用户名关键字、角色title关键字，接受缩写
*/
@property (nonatomic, copy, nullable) NSString *key;

/**
 format      : boolean
 type        : BOOL
 name        : leaveAlliance
 notes       : 查看离开盟还是没离开
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *leaveAlliance;

/**
 format      : boolean
 type        : BOOL
 name        : needTotal
 notes       : 是否需要返回列表总数（分页使用），默认为TRUE，建议在前端已知总数时填FALSE减轻服务器重复计算压力
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *needTotal;

/**
 format      : int32
 type        : int32_t
 name        : page
 notes       : 列表显示页码，从1开始
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *page;

/**
 format      : string
 type        : NSString
 name        : sortColumn
 notes       : 按哪一信息项进行排序，可选值为 name , gender , role , affair
*/
@property (nonatomic, copy, nullable) NSString *sortColumn;

@end