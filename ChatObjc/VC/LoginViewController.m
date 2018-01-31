//
//  LoginViewController.m
//  ChatObjc
//
//  Created by 典萱 高 on 2018/1/30.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginAPIConnectionManager.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    NSString *name = @ "qwert123456";
    NSString *pwd = @ "1234567";

    LoginAPIConnectionManager *loginManager = [[LoginAPIConnectionManager alloc] init];
    [loginManager userLoginWithName:name
                           password:pwd
     ];
    
}



@end
