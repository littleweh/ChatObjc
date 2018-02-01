//
//  ChatDetails.h
//  ChatObjc
//
//  Created by 典萱 高 on 2018/2/1.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ChatDetails: NSObject

@property (readonly) NSString * uId;
@property (readonly) NSString * message;
@property (readonly) NSString * receiverUId;
@property (readonly) NSString * senderUId;
@property (readonly) int sendBySelf;
@property (readonly) NSString * type;
@property (readonly) double timestamp;

-(instancetype) initWithUID: (NSString *) uId
                    message: (NSString *) message
                receiverUId: (NSString *) receiverUId
                  senderUId: (NSString *) senderUId
                 sendBySelf: (int) sendBySelf
                       type: (NSString *) type
                  timestamp: (double) timestamp;


@end
