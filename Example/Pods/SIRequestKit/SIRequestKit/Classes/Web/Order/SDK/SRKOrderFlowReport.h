//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKOrderFlowReport.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIFlowSummaryItem.h"
#import "SIFlowReportForm.h"
#import <Foundation/Foundation.h>

/**
 path       : /web/order/flow_report
 method     : POST
 summary    : 交易报表
 type       : FlowSummaryVO
 response   : SIFlowSummaryItem
*/
@interface SRKOrderFlowReport : NSObject

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
 key        : reportForm
 type       : FlowReportForm
 required   : true
 notes      : reportForm
*/
@property (nonatomic, strong, nullable) SIFlowReportForm *reportForm;

/**
 The class of response object[s]
 @return [SIFlowSummaryItem class]*/
+ (Class /*SIFlowSummaryItem*/ __nullable)responseClass;

- (NSDictionary *__nonnull)srk_config;

@end