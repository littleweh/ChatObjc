//
//  RegisterAPIConnectionManager.h
//  ChatObjc
//
//  Created by 典萱 高 on 2018/1/31.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#ifndef RegisterAPIConnectionManager_h
#define RegisterAPIConnectionManager_h

@interface RegisterAPIConnectionManager: NSObject

-(void)userRegisterWithName: (NSString *) name
userAge: (NSString *) age
password: (NSString *) pwd
confirmPassword: (NSString *) confirmPwd;

@end

#endif /* RegisterAPIConnectionManager_h */
