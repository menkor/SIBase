//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SIPushRequest.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIPushRequest : NSObject

/**
 format      : int64
 type        : int64_t
 name        : userId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *userId;

/**
 format      : HashMap
 type        : NSDictionary
 name        : messageMap
*/
@property (nonatomic, strong, nullable) NSDictionary *messageMap;

@end