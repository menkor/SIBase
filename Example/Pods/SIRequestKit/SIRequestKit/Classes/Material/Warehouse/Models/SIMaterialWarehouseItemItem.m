//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SIMaterialWarehouseItemItem.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIMaterialWarehouseItemItem.h"

@implementation SIMaterialWarehouseItemItem

/**
 The generic class mapper for container properties.
*/
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"leaders": [SIMaterialWarehouseLeaderItem class],
    };
}

/**
 Custom property mapper.
*/
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"id_p": @"id",
    };
}

/**
 Defined for database.
*/
+ (NSString *)primaryKey {
    return @"id_p";
}

@end