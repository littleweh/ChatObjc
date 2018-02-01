//
//  RegisterViewController.m
//  ChatObjc
//
//  Created by 典萱 高 on 2018/1/30.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterAPIConnectionManager.h"
#import "LoginViewController.h"
#import "NavigationController.h"
#import "Constant.h"


@interface RegisterViewController ()

@end

@implementation RegisterViewController
CGFloat buttonHeight = 50.0;
CGFloat MarginLeadingTrailingSpace = 10.0;
RegisterAPIConnectionManager *manager;
UIButton *registerButton;
UIButton *loginButton;
UITextField *nameTextField;
UITextField *ageTextField;
UITextField *pwdTextField;
UITextField *confirmPwdTextField;
UILabel *nameLabel;
UILabel *ageLabel;
UILabel *pwdLabel;

NSString *name;
NSString *age;
NSString *pwd;
NSString *confirmPwd;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    NSString *name = @ "testUser0201";
    NSString *age = @ "23";
    NSString *pwd = @ "12345678";
    NSString *confirmPwd = @ "123456";

    RegisterAPIConnectionManager *manager = [[RegisterAPIConnectionManager alloc] init];

    [self setNameLabel];
    [self setNameTextField];
    [self setRegisterButton];

}

-(void) setNameLabel {
    UIView *parent=self.view;

    nameLabel = [[UILabel alloc] init];
    [nameLabel setText:nameLabelText];
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.tintColor = [UIColor blackColor];
    [self.view addSubview:nameLabel];

    // Top
    NSLayoutConstraint *top =[NSLayoutConstraint
                              constraintWithItem:nameLabel
                              attribute:NSLayoutAttributeTopMargin
                              relatedBy:NSLayoutRelationEqual
                              toItem:parent
                              attribute:NSLayoutAttributeTopMargin
                              multiplier:1.0f
                              constant:20];
    // Leading
    NSLayoutConstraint *leading =[NSLayoutConstraint
                              constraintWithItem:nameLabel
                              attribute:NSLayoutAttributeLeft
                              relatedBy:NSLayoutRelationEqual
                              toItem:parent
                              attribute:NSLayoutAttributeLeftMargin
                              multiplier:1.0f
                              constant:MarginLeadingTrailingSpace];
    // width
    NSLayoutConstraint *width = [NSLayoutConstraint
                                 constraintWithItem:nameLabel
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:0.0f
                                 constant:40.0f];

    // height
    NSLayoutConstraint *height = [NSLayoutConstraint
                                 constraintWithItem:nameLabel
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:0.0f
                                 constant:40.0f];
}

-(void) setNameTextField {
    UIView *parent=self.view;

    nameTextField = [[UITextField alloc] init];
    nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    nameTextField.font = [UIFont systemFontOfSize:15];
    nameTextField.placeholder = @"enter name";
    nameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    nameTextField.keyboardType = UIKeyboardTypeDefault;
    nameTextField.returnKeyType = UIReturnKeyDone;
    nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    nameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    nameTextField.delegate = self;
    [self.view addSubview:nameTextField];

    // Top
    NSLayoutConstraint *top =[NSLayoutConstraint
                                   constraintWithItem:nameLabelText
                                   attribute:NSLayoutAttributeTopMargin
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:parent
                                   attribute:NSLayoutAttributeTopMargin
                                   multiplier:1.0f
                                   constant:20];
    // Trailing
    NSLayoutConstraint *trailing =[NSLayoutConstraint
                                   constraintWithItem:nameLabelText
                                   attribute:NSLayoutAttributeTrailing
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:parent
                                   attribute:NSLayoutAttributeTrailing
                                   multiplier:1.0f
                                   constant:-MarginLeadingTrailingSpace];
    // Leading

    //Height



}

- (void) setRegisterButton {

    UIView *parent=self.view;
    registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [registerButton setTitle:@ "Register" forState:UIControlStateNormal];
    registerButton.backgroundColor = [UIColor blackColor];
    registerButton.tintColor = [UIColor whiteColor];
    [self.view addSubview:registerButton];
    [registerButton addTarget:self action:@selector(registerAccount) forControlEvents:UIControlEventTouchUpInside];

    registerButton.translatesAutoresizingMaskIntoConstraints = NO;

    //Trailing
    NSLayoutConstraint *trailing =[NSLayoutConstraint
                                   constraintWithItem:registerButton
                                   attribute:NSLayoutAttributeTrailing
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:parent
                                   attribute:NSLayoutAttributeTrailing
                                   multiplier:1.0f
                                   constant:-MarginLeadingTrailingSpace];

    //Leading
    NSLayoutConstraint *leading = [NSLayoutConstraint
                                   constraintWithItem:registerButton
                                   attribute:NSLayoutAttributeLeading
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:parent
                                   attribute:NSLayoutAttributeLeading
                                   multiplier:1.0f
                                   constant:MarginLeadingTrailingSpace];

    //Bottom
    NSLayoutConstraint *bottom = [NSLayoutConstraint
                                   constraintWithItem:registerButton
                                   attribute:NSLayoutAttributeBottom
                                   relatedBy:NSLayoutRelationEqual toItem:parent
                                   attribute:NSLayoutAttributeBottom
                                   multiplier:1.0f
                                   constant:-30.0f];

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
                                   constant:-MarginLeadingTrailingSpace];

    //Leading
    NSLayoutConstraint *leading = [NSLayoutConstraint
                                   constraintWithItem:loginButton
                                   attribute:NSLayoutAttributeLeading
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:parent
                                   attribute:NSLayoutAttributeLeading
                                   multiplier:1.0f
                                   constant:MarginLeadingTrailingSpace];

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

- (void)showLoginVC {
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    NavigationController *navController = [[NavigationController alloc]initWithRootViewController:loginVC];
    [self presentViewController:navController animated:YES completion:nil];
}

-(void) registerAccount {
//    [manager userRegisterWithName:name
//                          userAge:age
//                         password:pwd
//                  confirmPassword:confirmPwd
//            withCompletionHandler:^(NSString * _Nullable cookies, NSError * _Nullable error) {
//                NSLog(@"%@", cookies);
//            }
//     ];
}


@end
