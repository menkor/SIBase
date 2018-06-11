//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAnnouncementPlanRoleView.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIRoleViewInfoItem.h"
#import "SIPlanRoleViewForm.h"
#import <Foundation/Foundation.h>

/**
 path       : /announcement/plan/role_view
 method     : POST
 summary    : 获取计划角色/发布视图信息
 type       : RoleViewInfoVO
 response   : SIRoleViewInfoItem
*/
@interface SRKAnnouncementPlanRoleView : NSObject

/**
 paramType  : header
 key        : X-SIMU-AffairId
 type       : int64
 required   : true
 notes      : X-SIMU-AffairId
 rename     : X_SIMU_AffairId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *X_SIMU_AffairId;

/**
 paramType  : header
 key        : X-SIMU-RoleId
 type       : int64
 required   : true
 notes      : X-SIMU-RoleId
 rename     : X_SIMU_RoleId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *X_SIMU_RoleId;

/**
 paramType  : body
 key        : form
 type       : PlanRoleViewForm
 required   : true
 notes      : form
*/
@property (nonatomic, strong, nullable) SIPlanRoleViewForm *form;

/**
 The class of response object[s]
 @return [SIRoleViewInfoItem class]*/
+ (Class /*SIRoleViewInfoItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end