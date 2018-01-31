//
//  RegisterAPIConnectionManager.m
//  ChatObjc
//
//  Created by 典萱 高 on 2018/1/30.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegisterAPIConnectionManager.h"
#import "Constant.h"

@implementation RegisterAPIConnectionManager

-(void)userRegisterWithName: (NSString *) name
                    userAge: (NSString *) age
                    password: (NSString *) pwd
            confirmPassword: (NSString *) confirmPwd
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
    NSURLSessionDataTask *dataTask = [
                                      session dataTaskWithRequest:request
                                      completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                          if (error) {
                                              NSLog(@"%@", error);
                                          } else {
                                              NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                              NSLog(@"%@", httpResponse);

                                              if (httpResponse.statusCode == 200) {
                                                  NSError *jsonError;
                                                  NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                  NSLog(@"Response JSON = %@", jsonString);
                                                  NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];

                                                  int sValue = [jsonObject[@"s"] intValue];
                                                  if (sValue <0) {
                                                      NSLog(@"%d", 123);

                                                      NSLog(@"%@", jsonObject[@"msg"]);
                                                      // ToDo: error handling
                                                  } else {
                                                      // sValue == 1 -> login API
                                                      // ToDo: OOP



                                                  }

                                              }
                                          }
                                      }];
    [dataTask resume];
}

@end
