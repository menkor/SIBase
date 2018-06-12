//
//  SIRequestCenter.m
//  SuperId
//
//  Created by Ye Tao on 2017/3/13.
//  Copyright © 2017年 SuperId. All rights reserved.
//

#import "SIRequestCenter.h"
#import "SIRequestMaker.h"
#import "_SIRequestPrivateDefine.h"
#import "_SIRequestUnit.h"
#import <AFNetworking/AFNetworking.h>

NSErrorDomain const SIRequestErrorDomain = @"com.superid.requestkit.error";

const NSInteger SIRequestErrorCode = -1;

const NSTimeInterval SIRequestDefaultTimeout = 5;

@interface SIRequestCenter ()

@property (nonatomic, strong) NSMutableDictionary *container;

@property (nonatomic, strong) NSMutableArray *queue;

@property (nonatomic, copy) void (^errorHandler)(NSError *error);

@property (nonatomic, copy) void (^logHandler)(NSString *log);

@property (nonatomic, copy) void (^monitorHandler)(id api, SIRequestStatus status, CGFloat duration);

@property (nonatomic, strong) NSMutableCharacterSet *escapeSet;

@end

@implementation SIRequestCenter

+ (instancetype)sharedInstance {
    static dispatch_once_t once = 0;
    static id instance = nil;

    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        //防止反复修改容器大小
        _container = [NSMutableDictionary dictionaryWithCapacity:3];
        _queue = [NSMutableArray arrayWithCapacity:3];
        _timeout = SIRequestDefaultTimeout;
        _verbose = YES;
        _escapeSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
        [_escapeSet removeCharactersInString:@"+;&=$,"];
    }
    return self;
}

NSString *SIRequestURLEncode(id value) {
    if (![value isKindOfClass:[NSString class]]) {
        return value;
    }
    value = [value stringByRemovingPercentEncoding];
    return [value stringByAddingPercentEncodingWithAllowedCharacters:[SIRequestCenter sharedInstance].escapeSet];
}

/**
 反序列化返回数据,有可能是数组
 @param responseData 服务器返回的字典数据
 @param className 类对应的class
 @return 成功,返回model, 失败,返回错误
 */
static inline id srk_deserializationResponse(id responseData, NSString *className) {
    if (!responseData) {
        return nil;
    }
    if ([responseData isKindOfClass:[NSArray class]] || [responseData isKindOfClass:[NSDictionary class]]) {
        return [SIRequestCenter sharedInstance].serialization(responseData, className);
    } else if ([responseData isKindOfClass:[NSNull class]]) {
        return nil;
    } else if ([responseData isKindOfClass:[NSString class]] || [responseData isKindOfClass:[NSNumber class]]) {
        return responseData;
    }
    //unkown class, assert first
    NSCAssert(NO, NSStringFromClass([responseData class]));
    return nil;
}

static inline void srk_wrapBodyParam(NSString *key, id value, NSMutableDictionary *param) {
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        param[key] = value;
    } else {
        NSDictionary *dict = [SIRequestCenter sharedInstance].deserialization(value);
        if (dict && [dict isKindOfClass:[NSDictionary class]]) {
            [dict enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key,
                                                      id _Nonnull obj,
                                                      BOOL *_Nonnull stop) {
                param[key] = obj;
            }];
        }
    }
}

static inline void srk_wrapQueryParam(NSString *key, id value, NSMutableString *uri) {
    [uri appendFormat:@"%@=%@&", key, SIRequestURLEncode(value)];
}

static inline void srk_wrapFormParam(NSString *key, UIImage *value, NSMutableDictionary *param) {
    NSData *imageData;
    if (UIImagePNGRepresentation(value)) {
        imageData = UIImagePNGRepresentation(value);
    } else {
        imageData = UIImageJPEGRepresentation(value, 1);
    }
    if (imageData.length > 1024 * 1024) {
        //如果图片大于1M，则压缩
        imageData = UIImageJPEGRepresentation(value, 0.7);
    }
    param[key] = imageData;
    param[kSIRequestConfigKeyParamType] = kSIRequestConfigKeyParamTypeForm;
}

static inline void srk_wrapPathParam(NSString *key, id value, NSMutableString *uri) {
    if ([value isKindOfClass:[NSNumber class]]) {
        value = [NSString stringWithFormat:@"%@", value];
    }
    NSString *temp = [NSString stringWithFormat:@"{%@}", key];
    [uri replaceOccurrencesOfString:temp
                         withString:value
                            options:NSCaseInsensitiveSearch
                              range:NSMakeRange(0, [uri length])];
}

static inline NSMutableDictionary *srk_wrapParam(NSArray *paramTemplate,
                                                 id model,
                                                 NSMutableString *uri,
                                                 NSMutableDictionary *header) {
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:paramTemplate.count];
    [paramTemplate enumerateObjectsUsingBlock:^(NSDictionary *_Nonnull obj,
                                                NSUInteger idx,
                                                BOOL *_Nonnull stop) {
        NSCAssert([obj isKindOfClass:[NSDictionary class]], @"Failed to read param in config");
        NSString *key = obj[kSIRequestConfigKeyParamKey];
        NSString *keyPath = obj[kSIRequestConfigKeyParamRename] ?: key;
        NSString *type = obj[kSIRequestConfigKeyParamType];
        id value = obj[kSIRequestConfigKeyParamValue];
        if (!value) {
            if ([model respondsToSelector:NSSelectorFromString(keyPath)]) {
                value = [model valueForKeyPath:keyPath]; // TODO : keyPath exception
            }
            if (!value) {
                return;
            }
        }
        if ([type isEqualToString:kSIRequestConfigKeyParamTypeQuery]) { // add it to uri TODO : default value
            srk_wrapQueryParam(key, value, uri);
        } else if ([type isEqualToString:kSIRequestConfigKeyParamTypeBody]) {
            srk_wrapBodyParam(key, value, param);
        } else if ([type isEqualToString:kSIRequestConfigKeyParamTypePath]) {
            srk_wrapPathParam(key, value, uri);
        } else if ([type isEqualToString:kSIRequestConfigKeyParamTypeForm]) {
            srk_wrapFormParam(key, value, param);
        } else if ([type isEqualToString:kSIRequestConfigKeyParamTypeHeader]) {
            if ([value isKindOfClass:[NSNumber class]]) {
                value = [NSString stringWithFormat:@"%@", value];
            }
            header[key] = value;
        } else {
            NSCAssert(!type, @"Who are you here!");
        }
    }];
    return param;
}

static inline NSString *srk_prettyJson(NSDictionary *object) {
    if (!object) {
        return nil;
    }
    if (![object isKindOfClass:[NSDictionary class]]) {
        return [object description];
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
    if (jsonData.length == 0) {
        return nil;
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (void)logResult:(BOOL)isSuccess responseObject:(id)responseObject uri:(NSMutableString *)uri {
    if (isSuccess) {
        NSString *log = [NSString stringWithFormat:@"\n%@\nresponse:\n%@", uri, srk_prettyJson(responseObject)];
        if (self.logHandler) {
            self.logHandler(log);
        } else {
            SIRKDLog(@"%@", log);
        }
    } else {
        NSError *error = responseObject;
        NSData *data = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSString *log = [NSString stringWithFormat:@"Failure: path [%@] error:\n[%@]", uri, string];
        if (self.logHandler) {
            self.logHandler(log);
        } else {
            SIRKDLog(@"%@", log);
        }
    }
}

- (nullable NSURLSessionDataTask *)request:(id<SIRequestKitProtocol>)model
                               customBlock:(void (^)(AFHTTPSessionManager *manager, id api))customBlock
                                completion:(SIRequestCompletionBlock)completion {
    //必须要自定义序列化与反序列化的方法
    NSParameterAssert(self.deserialization && self.serialization);
    //取出config
    NSParameterAssert([model respondsToSelector:@selector(srk_config)]);
    NSDictionary *config = [model srk_config];
    NSString *consumes = config[kSIRequestConfigKeyConsumes];
    //
    _SIRequestUnit *unit = [_SIRequestUnit unitWithManager:self.customSessionBlock timeout:self.timeout consumes:consumes];
    __weak typeof(model) weak_model = model;
    __weak typeof(self) weak_self = self;
    __weak typeof(unit.manager) weak_manager = unit.manager;
    //AOP
    unit.customBlock = ^(AFHTTPSessionManager *manager) {
        if (!weak_self.customBlock) {
            return;
        }
        weak_self.customBlock(manager, weak_model);
    };

    if (customBlock) {
        unit.customBlock = ^(AFHTTPSessionManager *manager) {
            customBlock(manager, weak_model);
        };
    }
    NSString *method = [config[kSIRequestConfigKeyMethod] uppercaseString];
    NSString *path = config[kSIRequestConfigKeyPath];
    NSString *url = config[kSIRequestConfigKeyUrl];
    NSArray *paramTemplate = config[kSIRequestConfigKeyParam];
    NSString *deserialization = config[kSIRequestConfigKeyDeserialization];
    NSMutableString *uri = [NSMutableString string];
    if (url) {
        [uri appendString:url];
    } else {
        if (config[kSIRequestConfigKeyLink]) {
            NSString *linkId = config[kSIRequestConfigKeyLink];
            NSString *linkUrl = self.linkDict[linkId];
            NSParameterAssert(linkUrl);
            [uri appendString:linkUrl];
        } else {
            [uri appendString:self.baseUri];
        }
        if (path) {
            [uri appendString:path];
        }
    }
    [uri appendString:@"?"];
    NSMutableDictionary *header = [NSMutableDictionary dictionary];
    NSMutableDictionary *param = srk_wrapParam(paramTemplate, model, uri, header);
    if ([uri hasSuffix:@"&"]) {
        [uri deleteCharactersInRange:NSMakeRange(uri.length - 1, 1)];
    }
    if ([uri hasSuffix:@"?"]) {
        [uri deleteCharactersInRange:NSMakeRange(uri.length - 1, 1)];
    }
    if (_verbose && !param[kSIRequestConfigKeyParamType]) {
        NSMutableDictionary *allHeader = [weak_manager.requestSerializer.HTTPRequestHeaders mutableCopy];
        [allHeader setValuesForKeysWithDictionary:header];
        NSString *log = [NSString stringWithFormat:@"\n[%@]\n%@\nheader\n%@\nparam\n%@", method, uri, srk_prettyJson(allHeader), srk_prettyJson(param)];
        if (self.logHandler) {
            self.logHandler(log);
        } else {
            SIRKDLog(@"%@", log);
        }
    }
    if (self.monitorHandler) {
        self.monitorHandler(model, SIRequestStatusBegin, 0);
    }
    NSURLSessionDataTask *task =
        [unit requestWithMethod:method
                            uri:uri
                         header:header
                          param:param
                     completion:^(BOOL isSuccess, id responseObject, NSURLResponse *response) {
                         __strong typeof(self) self = weak_self;
                         //make all these below a `promise` ?
                         if (self.verbose) {
                             [self logResult:isSuccess responseObject:responseObject uri:uri];
                         }
                         if (self.monitorHandler) {
                             self.monitorHandler(model, isSuccess ? SIRequestStatusFinish : SIRequestStatusFailed, unit.duration);
                         }
                         if (!completion) {
                             return;
                         }
                         //请求失败,直接返回
                         if (!isSuccess) {
                             [self dispatchError:responseObject];
                             completion(NO, responseObject);
                             return;
                         }
                         if (![responseObject isKindOfClass:[NSDictionary class]]) {
                             completion(YES, responseObject);
                             return;
                         }
                         NSNumber *code = responseObject[kSIRequestResponseCode];
                         if (code.integerValue != kSIRequestResponseOK) {
                             NSError *error = [NSError errorWithDomain:SIRequestErrorDomain code:code ? code.integerValue : -1 userInfo:responseObject];
                             [self dispatchError:error];
                             completion(NO, error);
                             return;
                         }
                         //取出服务器数据中`data`字段对应数据
                         id responseData = responseObject[kSIRequestResponseData];
                         //无需反序列化,直接返回服务器数据中`data`字段对应数据
                         if (!responseData) {
                             completion(YES, responseObject);
                             return;
                         }
                         id result = srk_deserializationResponse(responseData, deserialization);
                         completion(YES, result ?: responseData);
                         [self.queue removeObject:unit];
                     }];
    [self.queue addObject:unit];
    return task;
}

- (void)dispatchError:(NSError *)error {
    if ([error isKindOfClass:[NSError class]] && self.errorHandler) {
        self.errorHandler(error);
    }
}

@end

@implementation NSObject (SIRequest)

- (nullable NSURLSessionDataTask *)requestWithCompletion:(SIRequestCompletionBlock)completion {
    return [self requestWithCustomBlock:nil completion:completion];
}

- (nullable NSURLSessionDataTask *)requestWithCustomBlock:(void (^)(AFHTTPSessionManager *, id))customBlock completion:(SIRequestCompletionBlock)completion {
    return [[SIRequestCenter sharedInstance] request:(id<SIRequestKitProtocol>)self customBlock:customBlock completion:completion];
}

@end
