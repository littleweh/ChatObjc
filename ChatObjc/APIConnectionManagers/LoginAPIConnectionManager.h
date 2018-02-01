//
//  LoginAPIConnectionManager.h
//  ChatObjc
//
//  Created by 典萱 高 on 2018/1/31.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#ifndef LoginAPIConnectionManager_h
#define LoginAPIConnectionManager_h

@interface LoginAPIConnectionManager: NSObject

-(void)userLoginWithName: (NSString *) name
                password: (NSString *) pwd;

@end

#endif /* LoginAPIConnectionManager_h */
