

//
//  SIRequestMaker.m
//  AFNetworking
//
//  Created by Ye Tao on 2017/8/18.
//

#import "SIRequestMaker.h"
#import "_SIRequestPrivateDefine.h"

#define kSIRequestMakerMethodDict @{                   \
    @(SIRequestMakerOperationMethodGET): @"GET",       \
    @(SIRequestMakerOperationMethodPOST): @"POST",     \
    @(SIRequestMakerOperationMethodPUT): @"PUT",       \
    @(SIRequestMakerOperationMethodDELETE): @"DELETE", \
}

#define kSIRequestMakerParamDict @{                                          \
    @(SIRequestMakerOperationParamQuery): kSIRequestConfigKeyParamTypeQuery, \
    @(SIRequestMakerOperationParamBody): kSIRequestConfigKeyParamTypeBody,   \
    @(SIRequestMakerOperationParamPath): kSIRequestConfigKeyParamTypePath,   \
    @(SIRequestMakerOperationParamForm): kSIRequestConfigKeyParamTypeForm,   \
}

@interface SIRequestMaker ()

@property (nonatomic, strong) NSMutableDictionary *dict;

@property (nonatomic, assign) SIRequestMakerOperation paramOperation;

@end

@implementation SIRequestMaker

- (instancetype)init {
    self = [super init];
    if (self) {
        _dict = [NSMutableDictionary dictionary];
        _dict[kSIRequestConfigKeyParam] = [NSMutableArray array];
    }
    return self;
}

- (NSDictionary *)srk_config {
    return [_dict copy];
}

+ (SIRequestMaker *)make:(void (^)(SIRequestMaker *make))block {
    SIRequestMaker *maker = [SIRequestMaker new];
    if (block) {
        block(maker);
    }
    return maker;
}

- (SIRequestMaker * (^)(SIRequestMakerOperation method))method {
    return ^SIRequestMaker *(SIRequestMakerOperation method) {
        self.dict[kSIRequestConfigKeyMethod] = kSIRequestMakerMethodDict[@(method)];
        return self;
    };
}

- (SIRequestMaker * (^)(void))get {
    return ^SIRequestMaker *(void) {
        return self.method(SIRequestMakerOperationMethodGET);
    };
}

- (SIRequestMaker * (^)(void))post {
    return ^SIRequestMaker *(void) {
        return self.method(SIRequestMakerOperationMethodPOST);
    };
}

- (SIRequestMaker * (^)(NSString *path))path {
    return ^SIRequestMaker *(NSString *path) {
        self.dict[kSIRequestConfigKeyPath] = path;
        return self;
    };
}

- (SIRequestMaker * (^)(NSString *url))url {
    return ^SIRequestMaker *(NSString *url) {
        self.dict[kSIRequestConfigKeyUrl] = url;
        return self;
    };
}

- (SIRequestMaker * (^)(NSString *link))link {
    return ^SIRequestMaker *(NSString *link) {
        self.dict[kSIRequestConfigKeyLink] = link;
        return self;
    };
}

- (SIRequestMaker * (^)(NSString *response))response {
    return ^SIRequestMaker *(NSString *response) {
        self.dict[kSIRequestConfigKeyDeserialization] = response;
        return self;
    };
}

- (SIRequestMaker * (^)(SIRequestMakerOperation operation))paramType {
    return ^SIRequestMaker *(SIRequestMakerOperation operation) {
        self.paramOperation ^= 0x0f;
        self.paramOperation |= operation;
        return self;
    };
}

- (SIRequestMaker * (^)(NSDictionary *param))param {
    SIRequestMakerOperation paramOperation = self.paramOperation & SIRequestMakerOperationMethodMask;
    if (paramOperation == SIRequestMakerOperationNone) {
        //NSAssert(paramOperation != SIRequestMakerOperationNone, @"Please call SIRequestMaker.paramType() first, set to default type `query`");
        paramOperation = SIRequestMakerOperationParamQuery;
    }
    return ^SIRequestMaker *(NSDictionary *param) {
        NSMutableArray *paramArray = self.dict[kSIRequestConfigKeyParam];
        [param enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key,
                                                   id _Nonnull obj,
                                                   BOOL *_Nonnull stop) {
            [paramArray addObject:@{
                kSIRequestConfigKeyParamType: kSIRequestMakerParamDict[@(paramOperation)],
                kSIRequestConfigKeyParamKey: key,
                kSIRequestConfigKeyParamValue: obj,
            }];
        }];
        return self;
    };
}

@end
