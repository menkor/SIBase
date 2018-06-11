//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SRKAnnouncementFileSaveFileLog.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIAnnouncementFileForm.h"
#import <Foundation/Foundation.h>

/**
 path       : /announcement/file/save_file_log
 method     : POST
 summary    : 上传附件时调用保存一份文件记录在数据库中
 type       : boolean
 response   : BOOL
*/
@interface SRKAnnouncementFileSaveFileLog : NSObject

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
 paramType  : header
 key        : X-SIMU-AffairId
 type       : int64
 required   : true
 notes      : X-SIMU-AffairId
 rename     : X_SIMU_AffairId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *X_SIMU_AffairId;

/**
 paramType  : body
 key        : form
 type       : AnnouncementFileForm
 required   : true
 notes      : form
*/
@property (nonatomic, strong, nullable) SIAnnouncementFileForm *form;

- (NSDictionary *__nonnull)srk_config;

@end