//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SIChatGroupMembersItem.m
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIChatGroupMembersItem.h"

@implementation SIChatGroupMembersItem

/**
 The generic class mapper for container properties.
*/
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"groups": [SIChatGroupMemberGroupItem class],
        @"roles": [SIChatGroupMemberRoleItem class],
    };
}

@end