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
@property (nonatomic, strong) EKCalendar *ekCalendar;

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
    
    UIButton *btn6 = ({
        btn6 = [[UIButton alloc]init];
        btn6.backgroundColor = [UIColor orangeColor];
        [btn6 setTitle:@"获取所有日历源" forState:UIControlStateNormal];
        [btn6 addTarget:self action:@selector(onClickBtn6:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn6];
        btn6;
    });
    
    
    
    UIButton *btn5 = ({
        btn5 = [[UIButton alloc]init];
        btn5.backgroundColor = [UIColor orangeColor];
        [btn5 setTitle:@"本地日历源创建日历" forState:UIControlStateNormal];
        [btn5 addTarget:self action:@selector(onClickBtn5:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn5];
        btn5;
    });
    
    
    
    
    UIButton *btn2 = ({
        btn2 = [[UIButton alloc]init];
        btn2.backgroundColor = [UIColor orangeColor];
        [btn2 setTitle:@"谓词匹配日历事件" forState:UIControlStateNormal];
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
//        [self.view addSubview:btn4];
        btn4;
    });
    

    NSMutableArray *arr = [[NSMutableArray alloc]init];
    [arr addObject:btn1];
    [arr addObject:btn6];
    [arr addObject:btn5];
    [arr addObject:btn2];
    [arr addObject:btn3];
    
    
    [arr mas_distributeViewsAlongAxis:MASAxisTypeVertical
                           withFixedSpacing:40
                                leadSpacing:100
                                tailSpacing:30];
    [arr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(260);
    }];
    
}

- (void)onClickBtn1:(UIButton *)button {
    [self getCalendarSource];
}

- (void)onClickBtn2:(UIButton *)button {
    [self setAndGetCalendarSource:^(BOOL success) {
        if (success == YES) {
//            [iConsole info:@"谓词匹配事件"];/
        }
    }];
}

- (void)onClickBtn3:(UIButton *)button {
    [self setAndSaveEvent];
}

- (void)onClickBtn4:(UIButton *)button {
    [self getCalendarSource];
}

- (void)onClickBtn5:(UIButton *)button {
    [self createCalendarInLocalWithArray:[self getCalendars]];
}

- (void)onClickBtn6:(UIButton *)button {
    [self searchCalendarSourcesWithArray:[self getCalendars]];
}


#pragma mark - 获取事件存储对象

- (void)getEventStore {
    
    // MARK: 连接日历数据库对象
    
    // 1.plist 添加 NSCalendarsUsageDescription 允许
    
    // 2.创建连接日历数据库的对象 - 单例创建
}



#pragma mark - 获取日历

- (void)getCalendarSource {
    self.calendar = [NSCalendar currentCalendar];
}

#pragma mark - 获取所有日历源
- (NSArray *)getCalendars {
    NSArray *array = [EventStore shareManager].sources;
    NSString *calendarLog = [NSString stringWithFormat:@"所有日历源 - \n%@",array];
//    [iConsole info:@"%@", calendarLog];
    NSLog(@"%@",calendarLog);
    
    /**
     
     登录iCloud时会添加iCloud账户日历源
     
     EKSource <0x1700c9370> {UUID = 115BB0F3-0646-416E-8291-79BF5B8A0C23; type = Local; title = Default; externalID = (null)},
     EKSource <0x1700c9450> {UUID = C3B45857-E832-4361-A72C-8B942DBD7B2A; type = Other; title = Other; externalID = (null)},
     EKSource <0x1700c94c0> {UUID = F13E7F51-6893-45D2-B701-7DBDCA87F603; type = Subcribed; title = Subscribed Calendars; externalID = Subscribed Calendars},
     EKSource <0x1700c95a0> {UUID = B62D3675-8C5F-4EF5-800B-BEF2EBB9B01A; type = CalDAV; title = iCloud; externalID = B62D3675-8C5F-4EF5-800B-BEF2EBB9B01A}
     
     */
    return array;
}


#pragma mark - 日历源查询进阶

- (void)searchCalendarSourcesWithArray:(NSArray *)array {
    // 可根据title和type查询
    
    /*
        type

        // 本地
        EKSourceTypeLocal,
     
        // 某远程源
        EKSourceTypeExchange,
     
        // iCloud
        EKSourceTypeCalDAV,
     
        EKSourceTypeMobileMe,
     
        // 其他
        EKSourceTypeSubscribed,
        EKSourceTypeBirthdays
     
     */
    
    for (EKSource *source in array) {
        
        if (source.sourceType == EKSourceTypeCalDAV && [source.title isEqualToString:@"iCloud"]) {
            NSLog(@"这是iCloud日历源");
        }
        if (source.sourceType == EKSourceTypeLocal && [source.title isEqualToString:@"Default"]) {
            NSLog(@"这是本地日历源");
        }
        if ([source.title isEqualToString:@"Other"]) {
            NSLog(@"这是其他日历源");
        }
        
        NSLog(@"source.sourceType == %ld",(long)source.sourceType);
        NSLog(@"日历源 -\n日历id = %@\n日历标题 = %@",source.sourceIdentifier,source.title);
        
    }
}

#pragma mark - 本地日历源创建日历

- (void)createCalendarInLocalWithArray:(NSArray *)array {
    
    
    EKSource *localSource = nil;
    for (EKSource *source in array) {
        
        // 有iCloud的情况下
        if (source.sourceType == EKSourceTypeCalDAV && [source.title isEqualToString:@"iCloud"]) {
            NSLog(@"有iCloud的情况下 - iCloud日历源准备创建日历");
            localSource = source;
            NSSet *set = [source calendarsForEntityType:EKEntityTypeEvent];
            NSLog(@"所有日历%@",set);
            for (EKCalendar *ekCal in set) {
                if ([ekCal.title isEqualToString:@"火猫直播 - 本地"]) {
                    self.ekCalendar = ekCal;
                    return;
                }
            }
            break;
        }

        
        // 无iCloud的情况下
        if (source.sourceType == EKSourceTypeLocal && [source.title isEqualToString:@"Default"]) {
            NSLog(@"无iCloud的情况下 - 本地日历源准备创建日历");
            localSource = source;
            NSSet *set = [source calendarsForEntityType:EKEntityTypeEvent];
            for (EKCalendar *ekCal in set) {
                if ([ekCal.title isEqualToString:@"火猫直播 - 本地"]) {
                    self.ekCalendar = ekCal;
                    return;
                }
            }
            break;
        }
    }
    self.ekCalendar = [EKCalendar calendarForEntityType:EKEntityTypeEvent eventStore:[EventStore shareManager]];
    self.ekCalendar.source = localSource;
    self.ekCalendar.title = @"火猫直播 - 本地";//自定义日历标题
    self.ekCalendar.CGColor = [UIColor greenColor].CGColor;//自定义日历颜色
    NSError* error;
    BOOL status = [[EventStore shareManager] saveCalendar:self.ekCalendar commit:YES error:&error];
    NSLog(@"状态 - %d , 本地日历源日历id = %@",status,self.ekCalendar.calendarIdentifier);
    
    
    
}


#pragma mark - 谓词匹配日历事件
- (void)setAndGetCalendarSource:(void(^)(BOOL success))callback {

    // 1.创建开始日期组件
    NSDateComponents *startComponents = [[NSDateComponents alloc]init];
    startComponents.month = -1;
    NSDate *startDate = [self.calendar dateByAddingComponents:startComponents
                                                       toDate:[NSDate date] options:0];
    
    // 2.创建结束日期组件
    NSDateComponents *endComponents = [[NSDateComponents alloc]init];
    endComponents.month = 1;
    NSDate *endDate = [self.calendar dateByAddingComponents:endComponents
                                                     toDate:[NSDate date] options:0];
    
    
    // 3.从事件存储实例方法创建谓词
    NSPredicate *predicate = [[EventStore shareManager] predicateForEventsWithStartDate:startDate endDate:endDate calendars:nil];
    
    // 4.获取匹配的所有事件 (eventsMatchingPredicate为同步事件)
    dispatch_async(dispatch_get_main_queue(), ^{
        NSArray *events = [[EventStore shareManager] eventsMatchingPredicate:predicate];
//        [iConsole info:@"谓词匹配日历事件 - \n%@",events];
        NSLog(@"谓词匹配日历事件 - \n%@",events);
        callback(YES);
    });
    
    
}


#pragma mark - 使用唯一标示符获取事件

- (void)getEventWithIdentifier {
    
    // 情况1.已知唯一标识符
    
    // 情况2.循环事件获取唯一标示符
    
}

#pragma mark - 创建和编辑事件

- (void)setAndSaveEvent {
    
    /**
     
     向日历添加一个事件
     
         title - 事件标题
         notes - 事件备注
         location - 事件地址
         startDate - 开始时间
         endDate - 结束时间
         alarms - 提醒
         availability - 事件调度
     
     
     */
    
    EKEvent *event = [EKEvent eventWithEventStore:[EventStore shareManager]];
    
    // 标题
    event.title = @"EDG VS RNG 火热进行中";
    
    // 备注
    event.notes = @"火猫直播英雄联盟世界半决赛";
    
    // 地点
    event.location = @"上海浦东新区东方体育中心/火猫直播";
    
    
    NSDateFormatter *temp = [[NSDateFormatter alloc]init];
    [temp setDateFormat:@"yyyy.MM.dd HH:mm"];
    
    // 开始时间
    event.startDate = [[NSDate alloc]init];
    // 结束时间
    event.endDate = [[NSDate alloc]init];
    // 整天持续状态
    event.allDay = NO;
    
    
//    [event addAlarm:[EKAlarm alarmWithRelativeOffset:60.0f]];
    
    
    // 弹窗提醒时间
    [event addAlarm:[EKAlarm alarmWithAbsoluteDate:[temp dateFromString:@"2017.09.14 18:05"]]];
    
    
    // 插入URL跳转直播间
    NSString *str = [NSString stringWithFormat:@"huomaoiphone://?cid=8547&type=1&screenType=2"];
    str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [event setURL:[NSURL URLWithString:str]];
    
    
    // 设置日历对象
    NSLog(@"输出当前默认日历id = %@",self.ekCalendar.calendarIdentifier);
    [event setCalendar:self.ekCalendar];
    
//    EKRecurrenceRule *rule = [self repeatRule:repeatindex currentDate:dateString];
//    if (rule != nil) {
//        event.recurrenceRules = @[rule];
//    }else{
//        event.recurrenceRules = nil;
//    }
    
    // 时间插入日历
    NSError *err;
//    [[EventStore shareManager]saveEvent:event span:EKSpanThisEvent error:nil];
    [[EventStore shareManager]saveEvent:event span:EKSpanThisEvent commit:YES error:&err];
    
    
    /*
        span:设置跨度
        
            1.EKSpanThisEvent - 只影响当前事件
            2.EKSpanFutureEvents - 影响当前及以后事件
     
     
        commit:是否马上保存事件(类似sqlite里面的“事务”)
        
            1.YES:马上执行,立即把此次操作提交到系统事件库
            2.NO:不提交，直到调用commit方法时才执行
    */
    

    [iConsole info:@"创建和编辑事件成功!"];
}



#pragma mark - 设置重复规则
- (EKRecurrenceRule *)repeatRule:(NSInteger)repeatIndex currentDate:(NSString*)dateString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    // 当前时间
    NSDate *currentDate = [dateFormatter dateFromString:[dateString stringByAppendingString:@"0000"]];
    
    // 历法
    NSCalendar * gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    /*
     
        历法 - NSCalendarIdentifier
     
            NSCalendarIdentifierGregorian - 公历(阳历)
            NSCalendarIdentifierChinese - 中国历法(阴历)
            ...
     
     */
    
    
    NSDateComponents *components = [gregorian components:NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:currentDate];
    components.year += 1;
    NSDate *recurrenceEndDate = [gregorian dateFromComponents:components];//高频率：每天、每两天、工作日
    NSDateComponents *components2 = [gregorian components:NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:currentDate];
    components2.year += 3;
    NSDate *recurrenceEndDate2 = [gregorian dateFromComponents:components2];//低频率：每周、每月、每年
    
    EKRecurrenceRule * rule;
    switch (repeatIndex) {
        case 0://每天
            rule = [[EKRecurrenceRule alloc]initRecurrenceWithFrequency:EKRecurrenceFrequencyDaily interval:1 daysOfTheWeek:nil daysOfTheMonth:nil monthsOfTheYear:nil weeksOfTheYear:nil daysOfTheYear:nil setPositions:nil end:[EKRecurrenceEnd recurrenceEndWithEndDate:recurrenceEndDate]];
            break;
        case 1://每两天
            rule = [[EKRecurrenceRule alloc]initRecurrenceWithFrequency:EKRecurrenceFrequencyDaily interval:2 daysOfTheWeek:nil daysOfTheMonth:nil monthsOfTheYear:nil weeksOfTheYear:nil daysOfTheYear:nil setPositions:nil end:[EKRecurrenceEnd recurrenceEndWithEndDate:recurrenceEndDate]];
            break;
        case 2://每周
            rule = [[EKRecurrenceRule alloc]initRecurrenceWithFrequency:EKRecurrenceFrequencyWeekly interval:1 daysOfTheWeek:nil daysOfTheMonth:nil monthsOfTheYear:nil weeksOfTheYear:nil daysOfTheYear:nil setPositions:nil end:[EKRecurrenceEnd recurrenceEndWithEndDate:recurrenceEndDate2]];
            break;
        case 3://每月
            rule = [[EKRecurrenceRule alloc]initRecurrenceWithFrequency:EKRecurrenceFrequencyMonthly interval:1 daysOfTheWeek:nil daysOfTheMonth:nil monthsOfTheYear:nil weeksOfTheYear:nil daysOfTheYear:nil setPositions:nil end:[EKRecurrenceEnd recurrenceEndWithEndDate:recurrenceEndDate2]];
            break;
        case 4://每年
            rule = [[EKRecurrenceRule alloc]initRecurrenceWithFrequency:EKRecurrenceFrequencyYearly interval:1 daysOfTheWeek:nil daysOfTheMonth:nil monthsOfTheYear:nil weeksOfTheYear:nil daysOfTheYear:nil setPositions:nil end:[EKRecurrenceEnd recurrenceEndWithEndDate:recurrenceEndDate2]];
            break;
        case 5://工作日
            rule = [[EKRecurrenceRule alloc]initRecurrenceWithFrequency:EKRecurrenceFrequencyDaily interval:1 daysOfTheWeek:[NSArray arrayWithObjects:[EKRecurrenceDayOfWeek dayOfWeek:2],[EKRecurrenceDayOfWeek dayOfWeek:3],[EKRecurrenceDayOfWeek dayOfWeek:4],[EKRecurrenceDayOfWeek dayOfWeek:5],[EKRecurrenceDayOfWeek dayOfWeek:6],nil] daysOfTheMonth:nil monthsOfTheYear:nil weeksOfTheYear:nil daysOfTheYear:nil setPositions:nil end:[EKRecurrenceEnd recurrenceEndWithEndDate:recurrenceEndDate]];
            break;
        case 6:
            rule = nil;
            break;
        default:
            rule = nil;
            break;
    }
    return rule;
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
 
 
 
    EKEvent <0x17013fae0>
    {
        EKEvent <0x17013fae0>
        {
            title = 		EDG VS RNG 火热进行中;
            location = 	上海浦东新区东方体育中心/火猫直播;
            calendar = 	EKCalendar <0x1700bd280>
            {
                title = 火猫直播 - 本地;
                type = Local;
                allowsModify = YES;
                color = #00ff00;
            };
            alarms = 		<__NSArrayM 0x1702410b0>
            (
                EKAlarm <0x1740ce3f0>
                {
                    triggerDate = 2017-09-14 10:05:00 +0000
                }
            );
            URL = 			huomaoiphone://?cid=8547&type=1&screenType=2;
            lastModified = 2017-09-15 07:31:15 +0000;
            startTimeZone = 	Asia/Shanghai (GMT+8) offset 28800;
            startTimeZone = 	Asia/Shanghai (GMT+8) offset 28800
        };
        location = 	上海浦东新区东方体育中心/火猫直播;
        structuredLocation = 	EKStructuredLocation <0x1740bc2c0>
        {
            title = 上海浦东新区东方体育中心/火猫直播;
            address = (null);
            geo = (null);
            abID = (null);
            routing = (null);
            radius = 0.000000;
        };
        startDate = 	2017-09-15 07:31:15 +0000;
        endDate = 		2017-09-15 07:31:15 +0000;
        allDay = 		0;
        floating = 	0;
        recurrence = 	(null);
        attendees = 	(null);
        travelTime = 	(null);
        startLocation = 	(null);
    };,

 
 */



// 完成内容
// 获取iCloud或本地日历源
// 由日历源创建单一日历
// 对单一日历添加事件 - 事件支持直播间跳转









