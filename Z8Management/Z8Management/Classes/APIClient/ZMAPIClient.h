//
//  ZMAPIClient.h
//  Z8Management
//
//  Created by ThoDD1 on 8/6/14.
//  Copyright (c) 2014 FPT Software HoChiMinh. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@interface ZMAPIClient : AFHTTPRequestOperationManager

+(ZMAPIClient *)sharedClient;


#pragma mark - API Prototypes

- (void)loginWithUserName:(NSString *)userName password:(NSString *)pass completionBlock:(void(^)(NSDictionary * userInfo, NSError *error))block;
@end
