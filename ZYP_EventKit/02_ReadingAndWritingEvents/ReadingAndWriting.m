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
    
    
    UIButton *btn1 = ({
        btn1 = [[UIButton alloc]init];
        btn1.backgroundColor = [UIColor orangeColor];
        [btn1 setTitle:@"获取日历数据库" forState:UIControlStateNormal];
        [btn1 addTarget:self action:@selector(onClickBtn1:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn1];
        btn1;
    });
    
    UIButton *btn2 = ({
        btn2 = [[UIButton alloc]init];
        btn2.backgroundColor = [UIColor orangeColor];
        [btn2 setTitle:@"设置并获取日历源" forState:UIControlStateNormal];
        [btn2 addTarget:self action:@selector(onClickBtn2:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn2];
        btn2;
    });
    
    UIButton *btn3 = ({
        btn3 = [[UIButton alloc]init];
        btn3.backgroundColor = [UIColor orangeColor];
        [btn3 setTitle:@"创建和编辑事件" forState:UIControlStateNormal];
        [btn3 addTarget:self action:@selector(onClickBtn3:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn3];
        btn3;
    });
    
    UIButton *btn4 = ({
        btn4 = [[UIButton alloc]init];
        btn4.backgroundColor = [UIColor orangeColor];
        [btn4 setTitle:@"查询与删除事件" forState:UIControlStateNormal];
        [btn4 addTarget:self action:@selector(onClickBtn4:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn4];
        btn4;
    });
    

    NSMutableArray *arr = [[NSMutableArray alloc]init];
    [arr addObject:btn1];
    [arr addObject:btn2];
    [arr addObject:btn3];
    
    [arr mas_distributeViewsAlongAxis:MASAxisTypeVertical
                           withFixedSpacing:40
                                leadSpacing:100
                                tailSpacing:360];
    [arr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(180);
    }];
    
}

- (void)onClickBtn1:(UIButton *)button {
    [self getCalendarSource];
    [iConsole info:@"获取日历数据库成功!"];
}

- (void)onClickBtn2:(UIButton *)button {
    [self setAndGetCalendarSource:^(BOOL success) {
        if (success == YES) {
            [iConsole info:@"设置并获取日历源成功!"];
        }
    }];
}

- (void)onClickBtn3:(UIButton *)button {
    [self setupEvent];
    [iConsole info:@"创建和编辑事件成功!"];
}

- (void)onClickBtn4:(UIButton *)button {
    [self getCalendarSource];
    [iConsole info:@"获取日历数据库成功!"];
}


#pragma mark - 获取事件存储对象

- (void)getEventStore {
    
    // MARK: 连接日历数据库对象
    
    // 1.plist 添加 NSCalendarsUsageDescription 允许
    
    // 2.创建连接日历数据库的对象 - 单例创建
}



#pragma mark - 获取日历数据库

- (void)getCalendarSource {
    // MARK: 二、日历部分
    
    // 1.获取适当日历
    self.calendar = [NSCalendar currentCalendar];
    
}

#pragma mark - 设置并获取日历源

- (void)setAndGetCalendarSource:(void(^)(BOOL success))callback {

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
        callback(YES);
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
    
    
    EKEvent *event = [EKEvent eventWithEventStore:[EventStore shareManager]];
    event.title = @"EDG VS RNG 火热进行中";// 英雄联盟世界半决赛正式开赛
    event.notes = @"火猫直播现在开赛";//EDG VS RNG 18:00开赛
//    event.location = @"火猫直播";//上海浦东新区东方体育中心/
    NSDateFormatter *temp = [[NSDateFormatter alloc]init];
    [temp setDateFormat:@"yyyy.MM.dd HH:mm"];
    event.startDate = [[NSDate alloc]init];
    event.endDate = [[NSDate alloc]init];
    
//    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyy-MM dd:HH:mm"];
//    event.startDate = [formatter dateFromString:@"2017-09-14 13:52:00"];
//    event.endDate = [formatter dateFromString:@"2017-09-14 14:30:00"];
    event.allDay = NO;
    
    
//    [event addAlarm:[EKAlarm alarmWithRelativeOffset:60.0f *-60.0f*24]];
//    [event addAlarm:[EKAlarm alarmWithRelativeOffset:60.0f]];
    
    [event addAlarm:[EKAlarm alarmWithAbsoluteDate:[temp dateFromString:@"2017.09.14 18:05"]]];
    
    
    NSString *str = [NSString stringWithFormat:@"huomaoiphone://?cid=8547&type=1&screenType=2"];
    str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [event setURL:[NSURL URLWithString:str]];
    [event setCalendar:[[EventStore shareManager] defaultCalendarForNewEvents]];
    NSError *err;
    [[EventStore shareManager]saveEvent:event span:EKSpanThisEvent error:&err];
    [iConsole info:@"添加成功"];
    
    
    /** 
     
        向日历添加一个事件
            
        title - 事件标题
        notes - 事件备注
        location - 事件地址
        startDate - 开始日期
        endDate - 结束日期
        alarms - 闹钟
        availability - 事件调度
     
     */
    

    
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













