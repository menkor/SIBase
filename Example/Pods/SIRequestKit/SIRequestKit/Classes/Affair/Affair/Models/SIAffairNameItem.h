//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SIAffairNameItem.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIAffairNameItem : NSObject

/**
 format      : AffairNameVO
 type        : [SIAffairNameItem]
 name        : children
*/
@property (nonatomic, strong, nullable) NSArray<SIAffairNameItem *> *children;

/**
 format      : int64
 type        : int64_t
 name        : id
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *id_p;

/**
 format      : string
 type        : NSString
 name        : name
*/
@property (nonatomic, copy, nullable) NSString *name;

@end