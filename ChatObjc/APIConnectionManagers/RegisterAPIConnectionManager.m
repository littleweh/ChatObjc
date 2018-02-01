//
//  RegisterAPIConnectionManager.m
//  ChatObjc
//
//  Created by 典萱 高 on 2018/1/30.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegisterAPIConnectionManager.h"
#import "LoginAPIConnectionManager.h"
#import "Constant.h"

@implementation RegisterAPIConnectionManager

-(void)userRegisterWithName: (NSString *) name
                    userAge: (NSString *) age
                    password: (NSString *) pwd
            confirmPassword: (NSString *) confirmPwd
      withCompletionHandler: (void (^__nonnull)(NSString * __nullable cookies,
                                                 NSError * __nullable error)) loginCompletionHandler
{
    NSDictionary *parameters = @{ userName: name,
                                  userAge: age,
                                  userPassword: pwd,
                                  userConfirmPassword: confirmPwd };
    NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
    NSString *postLength = [NSString stringWithFormat:@ "%lu", (unsigned long)[postData length]];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:
                                    [NSURL URLWithString:
                                     [chatAPIUrl stringByAppendingString:registerEndPoint]
                                    ]
                                ];
    request.HTTPMethod = @"POST";

    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];

    [request setHTTPBody:postData];

    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *dataTask =
    [session dataTaskWithRequest:request
               completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                   if (error) {
                       NSLog(@"%@", error);
                       loginCompletionHandler(nil,error);
                       return;
                   } else {
                       NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                       NSLog(@"%@", httpResponse);

                       if (httpResponse.statusCode == 200) {
                           NSError *jsonError;
                           NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                           NSLog(@"Response JSON = %@", jsonString);
                           NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data                                                                        options:NSJSONReadingMutableContainers error:&jsonError];

                           int sValue = [jsonObject[@"s"] intValue];
                           if (sValue <0) {
                               NSLog(@"%@", jsonObject[@"msg"]);
                               // ToDo: error handling
                               // msg == "帳戶已註冊請登入!#" -> loginVC
                               // msg == "確認密碼錯誤!#" -> show alert, clean pwd, confirmPwd
                           } else {
                               LoginAPIConnectionManager *loginManager = [[LoginAPIConnectionManager alloc] init];
                               [loginManager userLoginWithName:name
                                                      password:pwd
                                         withCompletionHandler:loginCompletionHandler
                                ];
                           }

                       } else {
                           // ToDo: Error handling statusCode != 200
                           // Ask user to re-connect later, contact AS
                       }
                    }
    }];
    [dataTask resume];
}

@end
