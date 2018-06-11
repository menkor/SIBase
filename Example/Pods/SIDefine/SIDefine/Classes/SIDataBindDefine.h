//
//  SIDataBindDefine.h
//  SuperId
//
//  Created by Ye Tao on 2017/3/23.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#ifndef SIDataBindDefine_h
#define SIDataBindDefine_h

static NSString *__nonnull const kSIDataBindReloadAction = @"reload";

typedef void (^SIBindActionBlock)(__nullable id data);

@protocol SIDataBindProtocol <NSObject>

- (void)reloadWithData:(__nullable id)model;

@optional

- (void)initUI;

@property (nonatomic, copy, nullable) SIBindActionBlock actionBlock;

- (UIView *__nullable)bottomLine;

@end

#endif /* SIDataBindDefine_h */
