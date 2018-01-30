//
//  RegisterLoginViewController.m
//  ChatObjc
//
//  Created by 典萱 高 on 2018/1/30.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import "RegisterLoginViewController.h"

@interface RegisterLoginViewController ()

@end

@implementation RegisterLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [registerButton setTitle:@ "Register" forState:UIControlStateNormal];
    registerButton.backgroundColor = [UIColor blackColor];
    registerButton.tintColor = [UIColor whiteColor];
    registerButton.frame = CGRectMake(100, 100, 100, 30);
    [self.view addSubview:registerButton];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
