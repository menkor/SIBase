//
//  SIFormItem.h
//  SuperId
//
//  Created by Ye Tao on 2017/8/9.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import "SIFormItemDefine.h"
#import <Foundation/Foundation.h>
#import <SIDefine/SIDataBindDefine.h>

@class RACCommand;
NS_ASSUME_NONNULL_BEGIN

@interface SIFormItem : NSObject <SIFormItemProtocol>

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, assign) CGFloat width;

#pragma mark - UI

@property (nonatomic, copy, nullable) NSString *title;

@property (nonatomic, copy, nullable) NSString *subTitle;

@property (nonatomic, copy, nullable) NSString *content;

@property (nonatomic, copy, nullable) NSString *minValue; // __deprecated;

@property (nonatomic, copy, nullable) NSString *maxValue; // __deprecated;

@property (nonatomic, copy, nullable) NSString *avatar;

@property (nonatomic, copy, nullable) NSString *icon;

@property (nonatomic, strong, nullable) NSNumber *number;

@property (nonatomic, strong, nullable) NSNumber *min; // __deprecated;

@property (nonatomic, strong, nullable) NSNumber *max; // __deprecated;

@property (nonatomic, strong, nullable) id data;

@property (nonatomic, assign) BOOL hideAvatar;

// 用于时间选择的Cell，清空已选时间，及类似情况
@property (nonatomic, assign) BOOL dateCleanBtn __deprecated;

#pragma mark - Status

@property (nonatomic, assign) BOOL selected;

@property (nonatomic, assign) BOOL arrow;

#pragma mark - Action

@property (nonatomic, copy, nullable) NSString *key;

@property (nonatomic, strong, nullable) NSDictionary *userInfo;

#pragma mark - Input

@property (nonatomic, assign) BOOL required;

@property (nonatomic, strong, nullable) NSNumber *keyboardType;

@property (nonatomic, copy, nullable) NSString *placeHolder;

@property (nonatomic, assign) BOOL editEnable;

@property (nonatomic, assign) NSUInteger limit;

#pragma mark - Theme

@property (nonatomic, copy, nullable) NSDictionary *theme;

#pragma mark - Cell

@property (nonatomic, weak, nullable) id some;

#pragma mark - Compare

@property (nonatomic, strong, nullable) NSNumber *id_p;

#pragma mark - RACCommand

@property (nonatomic, strong, nullable) RACCommand *command;

@end
NS_ASSUME_NONNULL_END
