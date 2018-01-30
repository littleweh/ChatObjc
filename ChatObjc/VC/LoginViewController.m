//
//  LoginViewController.m
//  ChatObjc
//
//  Created by 典萱 高 on 2018/1/30.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    NSString *name = @ "qwert123456";
    NSString *pwd = @ "1234567";

    NSDictionary *loginParameters = @{ @"userName": name,
                                       @"pwd": pwd,
                                       };
    NSData *postLoginData = [NSJSONSerialization dataWithJSONObject:loginParameters options:0 error:nil];
    NSString *LoginDataLength = [NSString stringWithFormat:@ "%lu", (unsigned long)[postLoginData length]];

    NSMutableURLRequest *loginRequest = [NSMutableURLRequest requestWithURL:
                                         [NSURL URLWithString:
                                          @"http://13.113.252.61/user/login"]];

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
