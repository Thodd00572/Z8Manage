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
    });
    
    return _sharedClient;
}

#pragma mark - API Methods

- (void)loginWithUserName:(NSString *)userName password:(NSString *)pass completionBlock:(void(^)(NSDictionary * userInfo, NSEnumerator *error))block
{
    NSString * path  = kAPILogin;

}

@end
