//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SINeedCriteriaInfo.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SINeedCriteriaInfo : NSObject

/**
 format      : int64
 type        : int64_t
 name        : criteriaId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *criteriaId;

/**
 format      : string
 type        : NSString
 name        : formatCriteria
*/
@property (nonatomic, copy, nullable) NSString *formatCriteria;

/**
 format      : string
 type        : NSString
 name        : addRoleName
*/
@property (nonatomic, copy, nullable) NSString *addRoleName;

/**
 format      : int64
 type        : int64_t
 name        : addTime
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *addTime;

/**
 format      : boolean
 type        : BOOL
 name        : affectSubAffair
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *affectSubAffair;

/**
 format      : boolean
 type        : BOOL
 name        : nullCriteria
*/
@property (nonatomic, strong, nullable) NSNumber /*BOOL*/ *nullCriteria;

@end