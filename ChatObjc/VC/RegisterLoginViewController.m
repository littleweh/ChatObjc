//
//  RegisterLoginViewController.m
//  ChatObjc
//
//  Created by 典萱 高 on 2018/1/30.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import "RegisterLoginViewController.h"
#import "NavigationController.h"
#import "RegisterViewController.h"
#import "LoginViewController.h"

@interface RegisterLoginViewController ()

@end

@implementation RegisterLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];

    // registerButton
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [registerButton setTitle:@ "Register" forState:UIControlStateNormal];
    registerButton.backgroundColor = [UIColor blackColor];
    registerButton.tintColor = [UIColor whiteColor];
    registerButton.frame = CGRectMake(100, 100, 100, 30);
    [self.view addSubview:registerButton];

    // loginButton
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [loginButton setTitle:@ "Login" forState:UIControlStateNormal];
    loginButton.backgroundColor = [UIColor blackColor];
    loginButton.tintColor = [UIColor whiteColor];
    loginButton.frame = CGRectMake(100, 140, 100, 30);
    [self.view addSubview:loginButton];

    [registerButton addTarget:self action:@selector(showRegisterVC) forControlEvents:UIControlEventTouchUpInside];

    [loginButton addTarget:self action:@selector(showLoginVC) forControlEvents:UIControlEventTouchUpInside];

}
- (void)showRegisterVC {
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    NavigationController *navController = [[NavigationController alloc]initWithRootViewController:registerVC];
    [self presentViewController:navController animated:YES completion:nil];

}

- (void)showLoginVC {
    NSLog(@ "789");
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    NavigationController *navController = [[NavigationController alloc]initWithRootViewController:loginVC];
    [self presentViewController:navController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
