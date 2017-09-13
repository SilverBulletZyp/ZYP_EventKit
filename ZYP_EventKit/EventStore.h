//
//  EventStore.h
//  ZYP_EventKit
//
//  Created by 赵云鹏 on 2017/9/13.
//  Copyright © 2017年 赵云鹏. All rights reserved.
//

#import <EventKit/EventKit.h>

@interface EventStore : EKEventStore
+ (instancetype)shareManager;
@end
