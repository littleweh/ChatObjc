//
//  LoginAPIConnectionManager.m
//  ChatObjc
//
//  Created by 典萱 高 on 2018/1/31.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginAPIConnectionManager.h"
#import "Constant.h"

@implementation LoginAPIConnectionManager
-(void)userLoginWithName: (NSString *) name
                password: (NSString *) pwd
{
    NSDictionary *loginParameters = @{ userName: name,
                                       userPassword: pwd,
                                       };
    NSData *postLoginData = [NSJSONSerialization
                             dataWithJSONObject:loginParameters
                             options:0 error:nil
                             ];
    NSString *LoginDataLength = [NSString stringWithFormat:@ "%lu", (unsigned long)[postLoginData length]];

    NSMutableURLRequest *loginRequest = [NSMutableURLRequest requestWithURL:
                                         [NSURL URLWithString:
                                          [chatAPIUrl stringByAppendingString:loginEndPoint]
                                        ]];

    loginRequest.HTTPMethod = @"POST";
    [loginRequest setHTTPShouldHandleCookies:YES];

    [loginRequest setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [loginRequest setValue:LoginDataLength forHTTPHeaderField:@"Content-Length"];

    [loginRequest setHTTPBody:postLoginData];

    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:loginRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            NSLog(@"%@", httpResponse);
            NSDictionary *fields = [httpResponse allHeaderFields];
            NSString *cookie = [fields valueForKey:@"Set-Cookie"];
            NSLog(@"%@", cookie);

        }
    }];
    [dataTask resume];
}

@end

