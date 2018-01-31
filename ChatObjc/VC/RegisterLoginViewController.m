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
CGFloat buttonHeight = 30.0;
UIButton *registerButton;
UIButton *loginButton;


- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];

    [self setRegisterButton];
    [self setLoginButton];

}
- (void) setRegisterButton {

    UIView *parent=self.view;
    registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [registerButton setTitle:@ "Register" forState:UIControlStateNormal];
    registerButton.backgroundColor = [UIColor blackColor];
    registerButton.tintColor = [UIColor whiteColor];
    [self.view addSubview:registerButton];
    [registerButton addTarget:self action:@selector(showRegisterVC) forControlEvents:UIControlEventTouchUpInside];

    registerButton.translatesAutoresizingMaskIntoConstraints = NO;

    //Trailing
    NSLayoutConstraint *trailing =[NSLayoutConstraint
                                   constraintWithItem:registerButton
                                   attribute:NSLayoutAttributeTrailing
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:parent
                                   attribute:NSLayoutAttributeTrailing
                                   multiplier:1.0f
                                   constant:-20.f];

    //Leading

    NSLayoutConstraint *leading = [NSLayoutConstraint
                                   constraintWithItem:registerButton
                                   attribute:NSLayoutAttributeLeading
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:parent
                                   attribute:NSLayoutAttributeLeading
                                   multiplier:1.0f
                                   constant:20.f];

    //Bottom
    NSLayoutConstraint *bottom =[NSLayoutConstraint
                                 constraintWithItem:registerButton
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:parent
                                 attribute:NSLayoutAttributeBottom
                                 multiplier:1.0f
                                 constant:-30.f];

    //Height to be fixed for registerButton same as buttonHeight
    NSLayoutConstraint *height = [NSLayoutConstraint
                                  constraintWithItem:registerButton
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                  toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                  multiplier:0
                                  constant:buttonHeight];

    //Add constraints to the Parent
    [parent addConstraint:trailing];
    [parent addConstraint:bottom];
    [parent addConstraint:leading];

    //Add height constraint to the subview, as subview owns it.
    [registerButton addConstraint:height];
}

- (void) setLoginButton {
    // loginButton
    loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIView *parent=self.view;

    [loginButton setTitle:@ "Login" forState:UIControlStateNormal];
    loginButton.backgroundColor = [UIColor blackColor];
    loginButton.tintColor = [UIColor whiteColor];
    [self.view addSubview:loginButton];

    [loginButton addTarget:self action:@selector(showLoginVC) forControlEvents:UIControlEventTouchUpInside];

    loginButton.translatesAutoresizingMaskIntoConstraints = NO;

    //Trailing
    NSLayoutConstraint *trailing =[NSLayoutConstraint
                                   constraintWithItem:loginButton
                                   attribute:NSLayoutAttributeTrailing
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:parent
                                   attribute:NSLayoutAttributeTrailing
                                   multiplier:1.0f
                                   constant:-20.f];

    //Leading
    NSLayoutConstraint *leading = [NSLayoutConstraint
                                   constraintWithItem:loginButton
                                   attribute:NSLayoutAttributeLeading
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:parent
                                   attribute:NSLayoutAttributeLeading
                                   multiplier:1.0f
                                   constant:20.f];

    //Bottom
    NSLayoutConstraint *bottom =[NSLayoutConstraint
                                 constraintWithItem:loginButton
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:registerButton
                                 attribute:NSLayoutAttributeTop
                                 multiplier:1.0f
                                 constant:-10.f];

    //Height to be fixed for registerButton same as buttonHeight
    NSLayoutConstraint *height = [NSLayoutConstraint
                                  constraintWithItem:loginButton
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                  toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                  multiplier:0
                                  constant:buttonHeight];

    //Add constraints to the Parent
    [parent addConstraint:trailing];
    [parent addConstraint:bottom];
    [parent addConstraint:leading];

    //Add height constraint to the subview, as subview owns it.
    [loginButton addConstraint:height];
}

- (void)showRegisterVC {
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    NavigationController *navController = [[NavigationController alloc]initWithRootViewController:registerVC];
    [self presentViewController:navController animated:YES completion:nil];

}

- (void)showLoginVC {
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    NavigationController *navController = [[NavigationController alloc]initWithRootViewController:loginVC];
    [self presentViewController:navController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
