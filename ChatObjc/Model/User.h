//
//  User.h
//  ChatObjc
//
//  Created by 典萱 高 on 2018/2/1.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User: NSObject

@property (readonly) NSString * name;
@property (readonly) NSString * age;
@property (readonly) NSString * headImageURL;

-(instancetype) initWithName: (NSString *) name
                         age: (NSString *) age
                   headImage: (NSString *) headImageURL;

@end
