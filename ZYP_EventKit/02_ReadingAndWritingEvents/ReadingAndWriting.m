//
//  ReadingAndWriting.m
//  ZYP_EventKit
//
//  Created by 赵云鹏 on 2017/9/13.
//  Copyright © 2017年 赵云鹏. All rights reserved.
//  阅读和写作日历活动

#import "ReadingAndWriting.h"
#import <EventKit/EKEventStore.h>

@interface ReadingAndWriting ()

@end

@implementation ReadingAndWriting

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // MARK: 连接日历数据库对象
    
    // 1.plist 添加 NSCalendarsUsageDescription 允许
    
    // 2.创建连接日历数据库的对象
    EKEventStore *store = [[EKEventStore alloc]init];
    
    
    
    
    // MARK: 日历部分
    
    // 1.获取适当日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 2.创建开始日期组件
    NSDateComponents *startComponents = [[NSDateComponents alloc]init];
    startComponents.day = -1;
    NSDate *startDate = [calendar dateByAddingComponents:startComponents
                                                  toDate:[NSDate date] options:0];
    
    // 3.创建结束日期组件
    NSDateComponents *endComponents = [[NSDateComponents alloc]init];
    endComponents.day = 1;
    NSDate *endDate = [calendar dateByAddingComponents:startComponents
                                                  toDate:[NSDate date] options:0];
    
    
    
    
    
}


@end



/*
 
    注:
    1.不应该为每个与事件相关的任务初始化和释放单独的事件存储
    2.在应用程序加载时初始化单个事件存储，并重复使用它，以确保连接寿命长
    3.事件存储实例不能在其他EventKit对象之前被释放，否则可能会发生未定义的行为
 
    简单的说:全局单例、存储实例最后释放
 

 
 
 
 */












