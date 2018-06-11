//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SIAddFileSetItem.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIFileSetPublicType.h"
#import <Foundation/Foundation.h>

@interface SIAddFileSetItem : NSObject

/**
 format      : int64
 type        : int64_t
 name        : adminRoleIds
 notes       : 自己也需要显示加进去
*/
@property (nonatomic, strong, nullable) NSArray<NSNumber /*int64_t*/ *> *adminRoleIds;

/**
 format      : boolean
 type        : BOOL
 name        : affairChecked
 notes       : 管理员选择是否选中本事务所有角色
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *affairChecked;

/**
 format      : int64
 type        : int64_t
 name        : id
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *id_p;

/**
 format      : HashMap
 type        : NSDictionary
 name        : map
 notes       : 0:指定事务公开 1:指定角色公开
*/
@property (nonatomic, strong, nullable) NSDictionary *map;

/**
 format      : string
 type        : NSString
 name        : name
*/
@property (nonatomic, copy, nullable) NSString *name;

/**
 format      : FileSetPublicType
 type        : SIFileSetPublicType
 name        : publicType
*/
@property (nonatomic, strong, nullable) SIFileSetPublicType *publicType;

@end