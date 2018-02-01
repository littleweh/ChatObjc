//
//  User.m
//  ChatObjc
//
//  Created by 典萱 高 on 2018/2/1.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import "User.h"

@interface User ()

@property NSString * name;
@property NSString * age;
@property NSString * headImageURL;

@end

@implementation User

-(instancetype) initWithName: (NSString *) name
                         age: (NSString *) age
                   headImage: (NSString *) headImageURL
{
    if (self = [super init]) {
        self.name = name;
        self.age = age;
        self.headImageURL = headImageURL;
    }
    return self;
}



@end
