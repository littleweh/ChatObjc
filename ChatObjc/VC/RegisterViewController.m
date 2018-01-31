//
//  RegisterViewController.m
//  ChatObjc
//
//  Created by 典萱 高 on 2018/1/30.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterAPIConnectionManager.h"


@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    NSString *name = @ "testUser1";
    NSString *age = @ "23";
    NSString *pwd = @ "12345678";
    NSString *confirmPwd = @ "123456";

    RegisterAPIConnectionManager *manager = [[RegisterAPIConnectionManager alloc] init];
    [manager userRegisterWithName:name
                          userAge:age
                         password:pwd
                  confirmPassword:confirmPwd
     ];

}


@end
