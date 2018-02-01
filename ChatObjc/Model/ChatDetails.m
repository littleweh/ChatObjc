//
//  ChatDetails.m
//  ChatObjc
//
//  Created by 典萱 高 on 2018/2/1.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import "ChatDetails.h"

@interface ChatDetails ()

@property NSString * uId;
@property NSString * message;
@property NSString * receiverUId;
@property NSString * senderUId;
@property int sendBySelf;
@property NSString * type;
@property double timestamp;

@end

@implementation ChatDetails

-(instancetype) initWithUID: (NSString *) uId
                    message: (NSString *) message
                receiverUId: (NSString *) receiverUId
                  senderUId: (NSString *) senderUId
                 sendBySelf: (int) sendBySelf
                       type: (NSString *) type
                  timestamp: (double) timestamp
{
    if (self = [super init]) {
        self.uId = uId;
        self.message = message;
        self.receiverUId = receiverUId;
        self.senderUId = senderUId;
        self.sendBySelf = sendBySelf;
        self.type = type;
        self.timestamp = timestamp;
    }
    return self;
}


@end
