//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SISubAffairsOrdersItem.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIAffairOrderItem.h"
#import <Foundation/Foundation.h>

@interface SISubAffairsOrdersItem : NSObject

/**
 format      : AffairOrderVO
 type        : [SIAffairOrderItem]
 name        : orders
*/
@property (nonatomic, strong, nullable) NSArray<SIAffairOrderItem *> *orders;

/**
 format      : HashMap
 type        : NSDictionary
 name        : sum
*/
@property (nonatomic, strong, nullable) NSDictionary *sum;

@end