//
//  ZMAPIClient.m
//  Z8Management
//
//  Created by ThoDD1 on 8/6/14.
//  Copyright (c) 2014 FPT Software HoChiMinh. All rights reserved.
//

#import "ZMAPIClient.h"

@implementation ZMAPIClient

+(ZMAPIClient *)sharedClient
{
    static ZMAPIClient * _sharedClient = nil;
    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        _sharedClient = [[ZMAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
        [_sharedClient setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    });
    
    return _sharedClient;
}

#pragma mark - API Methods

- (void)loginWithUserName:(NSString *)userName password:(NSString *)pass completionBlock:(void(^)(NSDictionary * userInfo, NSError *error))block
{
    
    NSString * path  = kAPILogin;
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setObject:userName forKey:kAPILoginKeyUsername];
    [params setObject:pass forKey:kAPILoginKeyPassword];
    
    [self POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject != nil)
        {
            NSDictionary * resultDict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            if (resultDict != nil)
            {
                block(resultDict, nil);
            }
            else
            {
                block(nil,[NSError errorWithDomain:@"Unknow Error!" code:0 userInfo:nil]);
            }
        }
        else
        {
            block(nil,[NSError errorWithDomain:@"Unknow Error!" code:0 userInfo:nil]);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(nil, error);
    }];
}

@end
