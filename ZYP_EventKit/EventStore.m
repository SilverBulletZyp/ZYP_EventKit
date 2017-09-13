//
//  EventStore.m
//  ZYP_EventKit
//
//  Created by 赵云鹏 on 2017/9/13.
//  Copyright © 2017年 赵云鹏. All rights reserved.
//

#import "EventStore.h"

@implementation EventStore

+ (instancetype)shareManager {
    // 连接日历数据库的对象
    static EventStore *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[EventStore alloc] init];
    });
    return instance;
}

@end
