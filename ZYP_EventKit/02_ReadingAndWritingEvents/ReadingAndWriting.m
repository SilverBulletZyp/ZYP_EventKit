//
//  ReadingAndWriting.m
//  ZYP_EventKit
//
//  Created by 赵云鹏 on 2017/9/13.
//  Copyright © 2017年 赵云鹏. All rights reserved.
//  阅读和写作日历活动

#import "ReadingAndWriting.h"


@interface ReadingAndWriting ()
// 日历
@property (nonatomic, strong) NSCalendar *calendar;

@end

@implementation ReadingAndWriting

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // MARK: 一、连接日历数据库对象
    
    // 1.plist 添加 NSCalendarsUsageDescription 允许
    
    // 2.创建连接日历数据库的对象 - 单例
    

    
    
    
}

#pragma mark - 获取日历数据库

- (void)getCalendarSource {
    // MARK: 二、日历部分
    
    // 1.获取适当日历
    self.calendar = [NSCalendar currentCalendar];
    
    // 2.创建开始日期组件
    NSDateComponents *startComponents = [[NSDateComponents alloc]init];
    startComponents.day = -1;
    NSDate *startDate = [self.calendar dateByAddingComponents:startComponents
                                                       toDate:[NSDate date] options:0];
    
    // 3.创建结束日期组件
    NSDateComponents *endComponents = [[NSDateComponents alloc]init];
    endComponents.year = 1;
    NSDate *endDate = [self.calendar dateByAddingComponents:endComponents
                                                     toDate:[NSDate date] options:0];
    
    // 4.从事件存储实例方法创建谓词
    NSPredicate *predicate = [[EventStore shareManager] predicateForEventsWithStartDate:startDate endDate:endDate calendars:nil];
    
    
    // 5.获取匹配的所有事件 (eventsMatchingPredicate为同步事件)
    dispatch_async(dispatch_get_main_queue(), ^{
        NSArray *events = [[EventStore shareManager] eventsMatchingPredicate:predicate];
        NSLog(@"获取事件 - %@",events);
    });
    
    NSLog(@"查看所有日历源 - %@",[EventStore shareManager].sources);
}


#pragma mark - 使用唯一标示符获取事件
- (void)getEventWithIdentifier {
    
    // 情况1.已知唯一标识符
//    NSPredicate *pre1 = [self]
    
    
    // 情况2.循环事件获取唯一标示符
    
}

#pragma mark - 创建和编辑事件

- (void)setupEvent {
    
}


@end



/*
 
    注:
    1.不应该为每个与事件相关的任务初始化和释放单独的事件存储
    2.在应用程序加载时初始化单个事件存储，并重复使用它，以确保连接寿命长
    3.事件存储实例不能在其他EventKit对象之前被释放，否则可能会发生未定义的行为
 
    简单的说:全局单例、存储实例最后释放
 

 
 
 
 */


/*
    日历源范例:
 
    (
        EKSource <0x6100002c3aa0> 
        {
            UUID = F146FB3D-C40C-4ACF-AA9D-0BE77C4A1192; 
            type = Subcribed;
            title = Subscribed 
            Calendars; 
            externalID = Subscribed Calendars
        },
        EKSource <0x6100002c4130> 
        {
            UUID = C599A773-6154-4FDA-B5B5-BCC7882B7A86;
            type = Local; 
            title = Default;
            externalID = (null)
        },
        EKSource <0x6100002c40c0> 
        {
            UUID = 00540A70-D539-4AB2-818C-F0EE5F6E7238;
            type = Other; 
            title = Other; 
            externalID = (null)
        }
    )
 
 
 
    事件范例:
 
    EKEvent <0x6100003404d0>
    {
        EKEvent <0x6100003404d0>
        {
            title = 		Columbus Day;
            location = 	;
            calendar = 	EKCalendar <0x6080000bb420>
            {
                title = US Holidays;
                type = Subscription;
                allowsModify = NO;
                color = #CC73E1;
            };
            alarms = 		(null);
            URL = 			(null);
            lastModified = 2016-04-22 00:00:30 +0000;
            startTimeZone = 	(null);
            startTimeZone = 	(null)
        };
        location = 	;
        structuredLocation = 	(null);
        startDate = 	2017-10-08 16:00:00 +0000;
        endDate = 		2017-10-09 15:59:59 +0000;
        allDay = 		1;
        floating = 	1;
        recurrence = 	EKRecurrenceRule <0x6100000bc260> RRULE FREQ=YEARLY;INTERVAL=1;COUNT=6;BYMONTH=10;BYDAY=2MO;
        attendees = 	(null);
        travelTime = 	(null);
        startLocation = 	(null);
    };,
 
 */













