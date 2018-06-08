//
//  _SIRequestPrivateDefine.h
//  Pods
//
//  Created by Ye Tao on 2017/3/15.
//
//

#ifndef _SIRequestPrivateDefine_h
#define _SIRequestPrivateDefine_h

#pragma mark - Config Key

static NSString *const kSIRequestConfigKeyUrl = @"url"; // like `http://192.168.1.100:8888/response_code_list`

static NSString *const kSIRequestConfigKeyPath = @"path"; // like `/user`

static NSString *const kSIRequestConfigKeyMethod = @"method"; // like `get` or `post`

static NSString *const kSIRequestConfigKeyParam = @"param";

static NSString *const kSIRequestConfigKeyLink = @"link";

static NSString *const kSIRequestConfigKeyConsumes = @"consumes";

static NSString *const kSIRequestConfigKeyParamKey = @"key";

static NSString *const kSIRequestConfigKeyParamValue = @"value";

static NSString *const kSIRequestConfigKeyParamRename = @"rename";

static NSString *const kSIRequestConfigKeyParamType = @"paramType";

static NSString *const kSIRequestConfigKeyParamTypeQuery = @"query"; // add to url

static NSString *const kSIRequestConfigKeyParamTypeBody = @"body"; // add to post body

static NSString *const kSIRequestConfigKeyParamTypePath = @"path"; // in url like `/user/{id}`

static NSString *const kSIRequestConfigKeyParamTypeHeader = @"header"; // add to header

static NSString *const kSIRequestConfigKeyParamTypeForm = @"form"; // upload file

static NSString *const kSIRequestConfigKeyDeserialization = @"response"; // too long ,just `response`

static NSString *const kSIRequestResponseCode = @"code";

static NSString *const kSIRequestResponseData = @"data";

static NSString *const kSIRequestClassPrefix = @"SI";

static const NSInteger kSIRequestResponseOK = 0;

//TODO
typedef NS_ENUM(NSUInteger, SIRequestConfigKeyParamType) {
    SIRequestConfigKeyParamTypeQuery,
    SIRequestConfigKeyParamTypeBody,
    SIRequestConfigKeyParamTypePath,
};

#ifdef DEBUG

#define SIRKDLog(s, ...) NSLog(@"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])

#else

#define SIRKDLog(s, ...)

#endif

#endif /* _SIRequestPrivateDefine_h */
