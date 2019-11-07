//
//  SIFormItem.m
//  SuperId
//
//  Created by Ye Tao on 2017/8/9.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import "SIFormItem.h"

@implementation SIFormItem

- (BOOL)isEqual:(SIFormItem *)object {
    if ([object isKindOfClass:[self class]]) {
        return [self.id_p isEqualToNumber:object.id_p];
    }
    return NO;
}

- (NSMapTable *)strongToWeakMap {
    if (!_strongToWeakMap) {
        _strongToWeakMap = [NSMapTable strongToWeakObjectsMapTable];
    }
    return _strongToWeakMap;
}

@end
