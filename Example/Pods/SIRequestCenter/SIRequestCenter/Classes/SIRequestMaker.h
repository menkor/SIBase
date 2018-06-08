//
//  SIRequestMaker.h
//  AFNetworking
//
//  Created by Ye Tao on 2017/8/18.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, SIRequestMakerOperation) {
    SIRequestMakerOperationNone = 0,
    SIRequestMakerOperationParamMask = 0x0F,
    SIRequestMakerOperationParamQuery = 0x01,
    SIRequestMakerOperationParamBody = 0x02,
    SIRequestMakerOperationParamPath = 0x03,
    SIRequestMakerOperationParamForm = 0x04,

    SIRequestMakerOperationMethodMask = 0xF0,
    SIRequestMakerOperationMethodGET = 0x10,
    SIRequestMakerOperationMethodPOST = 0x20,
    SIRequestMakerOperationMethodPUT = 0x30,
    SIRequestMakerOperationMethodDELETE = 0x40,
};

@interface SIRequestMaker : NSObject

+ (SIRequestMaker *)make:(void (^)(SIRequestMaker *make))block;

@property (nonatomic, readonly) NSDictionary *srk_config;

- (SIRequestMaker * (^)(SIRequestMakerOperation method))method;

- (SIRequestMaker * (^)(NSString *path))path;

- (SIRequestMaker * (^)(void))get;

- (SIRequestMaker * (^)(void))post;

- (SIRequestMaker * (^)(NSString *url))url;

- (SIRequestMaker * (^)(NSString *link))link;

- (SIRequestMaker * (^)(NSString *response))response;

- (SIRequestMaker * (^)(SIRequestMakerOperation operation))paramType;

- (SIRequestMaker * (^)(NSDictionary *param))param;

@end
