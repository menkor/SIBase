//
//  Generated by the swagger2objc.  DO NOT EDIT!
//  SICreateAnnouncementTaskForm.h
//  Super Id
//
//  Copyright © 2018 SiMu. All rights reserved.
//

#import "SIFileDetailForm.h"
#import <Foundation/Foundation.h>

@interface SICreateAnnouncementTaskForm : NSObject

/**
 format      : string
 type        : NSString
 name        : address
*/
@property (nonatomic, copy, nullable) NSString *address;

/**
 format      : int64
 type        : int64_t
 name        : announcementId
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *announcementId;

/**
 format      : double
 type        : double
 name        : beginTime
*/
@property (nonatomic, strong, nullable) NSNumber /*double*/ *beginTime;

/**
 format      : int32
 type        : int32_t
 name        : keyState
 notes       : 0是普通工作,1是关键工作
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *keyState;

/**
 format      : double
 type        : double
 name        : lastTime
*/
@property (nonatomic, strong, nullable) NSNumber /*double*/ *lastTime;

/**
 format      : int64
 type        : int64_t
 name        : manageRole
*/
@property (nonatomic, strong, nullable) NSNumber /*int64_t*/ *manageRole;

/**
 format      : string
 type        : NSString
 name        : note
*/
@property (nonatomic, copy, nullable) NSString *note;

/**
 format      : double
 type        : double
 name        : offTime
*/
@property (nonatomic, strong, nullable) NSNumber /*double*/ *offTime;

/**
 format      : int32
 type        : int32_t
 name        : priority
 notes       : 优先级,0高,1中,2低
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *priority;

/**
 format      : int64
 type        : int64_t
 name        : roleIds
*/
@property (nonatomic, strong, nullable) NSArray<NSNumber /*int64_t*/ *> *roleIds;

/**
 format      : int32
 type        : int32_t
 name        : state
*/
@property (nonatomic, strong, nullable) NSNumber /*int32_t*/ *state;

/**
 format      : FileDetailForm
 type        : [SIFileDetailForm]
 name        : storeUrlList
 notes       : 文件库上传文件
*/
@property (nonatomic, strong, nullable) NSArray<SIFileDetailForm *> *storeUrlList;

/**
 format      : string
 type        : NSString
 name        : title
*/
@property (nonatomic, copy, nullable) NSString *title;

/**
 format      : FileDetailForm
 type        : [SIFileDetailForm]
 name        : urlList
 notes       : 本地上传文件
*/
@property (nonatomic, strong, nullable) NSArray<SIFileDetailForm *> *urlList;

@end