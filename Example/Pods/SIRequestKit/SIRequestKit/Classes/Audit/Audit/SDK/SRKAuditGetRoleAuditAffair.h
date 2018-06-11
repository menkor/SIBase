//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAuditGetRoleAuditAffair.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIRoleAuditAffairItem.h"
#import <Foundation/Foundation.h>

/**
 path       : /audit/config/{roleId}/getAuditAffair
 method     : GET
 summary    : 获取当前角色有审批配置的事务
 type       : RoleAuditAffairVO
 response   : SIRoleAuditAffairItem
*/
@interface SRKAuditGetRoleAuditAffair : NSObject

/**
 paramType  : path
 key        : roleId
 type       : int64
 required   : true
 notes      : 
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *roleId;

/**
 The class of response object[s]
 @return [SIRoleAuditAffairItem class]*/
+ (Class /*SIRoleAuditAffairItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end