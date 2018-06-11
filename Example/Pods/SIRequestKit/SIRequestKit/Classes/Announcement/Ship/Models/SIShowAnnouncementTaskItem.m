//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SIShowAnnouncementTaskItem.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIShowAnnouncementTaskItem.h"

@implementation SIShowAnnouncementTaskItem

/**
 The generic class mapper for container properties.
*/
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"historyOwnerRoles": [SIAnnouncementTaskRoleItem class],
        @"joinRoles": [SIAnnouncementTaskRoleItem class],
        @"shipTasks": [SIPlanShipTaskItem class],
    };
}

/**
 Defined for database.
*/
+ (NSString *)primaryKey {
    return @"announcementTaskId";
}

@end