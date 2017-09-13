//
//  IntroductionVC.h
//  ZYP_EventKit
//
//  Created by 赵云鹏 on 2017/9/13.
//  Copyright © 2017年 赵云鹏. All rights reserved.
//  框架简介

#import <ZYP_HomeViewController/ZYP_HomeViewController.h>

@interface IntroductionVC : ZYPBaseViewController

@end

#pragma mark - EventKit简介

/* 
    事件提醒开发包 EventKit
 
    用途:
    1.检索用户的日历及提醒数据
    2.为日历创建新的提醒
    3.编辑和删除事件提醒
    4.添加警报或指定循环事件
 
    注:
    1.应用程序外部更改日历数据库时，EventKit可以通过通知来检测更改
    2.使用EventKit对日历项进行的更改将自动同步到关联的日历(CalDAV，Exchange等)
 
    
    1.事件库 -> 直接操作日历数据库
    2.事件源 ->
    3.日历
    4.事件提醒
 
    
    数据库:
    日历数据库 - 保存日历和提醒信息
    
    注:
    1.iOS 10.0 以上 plist 文件需添加 NSRemindersUsageDescription 和 NSCalendarsUsageDescription
    2.沙盒OSX应用程序都必须包含com.apple.security.personal-information.calendars权利
    3.要了解有关App Sandbox的权利的更多信息，参阅启用应用程序沙箱
      https://developer.apple.com/library/content/documentation/Miscellaneous/Reference/EntitlementKeyReference/Chapters/EnablingAppSandbox.html#//apple_ref/doc/uid/TP40011195-CH4-SW4
 

 */

#pragma mark - 集成简介

/*
 
    阅读和写作日历活动 
        - 介绍如何检索，创建和修改日历事件
        https://developer.apple.com/library/content/documentation/DataManagement/Conceptual/EventKitProgGuide/ReadingAndWritingEvents.html#//apple_ref/doc/uid/TP40004775-SW1
    
    阅读和写作提醒
        - 说明如何检索，创建和修改提醒
        https://developer.apple.com/library/content/documentation/DataManagement/Conceptual/EventKitProgGuide/ReadingAndWritingReminders/ReadingAndWritingReminders.html#//apple_ref/doc/uid/TP40009765-CH5-SW1
    
    配置警报
        - 说明如何将警报附加到日历项目
        https://developer.apple.com/library/content/documentation/DataManagement/Conceptual/EventKitProgGuide/ConfiguringAlarms/ConfiguringAlarms.html#//apple_ref/doc/uid/TP40009765-CH6-SW1
    
    创建循环事件
        - 说明如何使事件成为循环事件
        https://developer.apple.com/library/content/documentation/DataManagement/Conceptual/EventKitProgGuide/CreatingRecurringEvents/CreatingRecurringEvents.html#//apple_ref/doc/uid/TP40009765-CH3-SW1
    
    观察日历数据库的外部更改
        - 说明了如何注册有关日历数据库的外部更改的通知
        https://developer.apple.com/library/content/documentation/DataManagement/Conceptual/EventKitProgGuide/ObservingChanges/ObservingChanges.html#//apple_ref/doc/uid/TP40009765-CH4-SW1
    
    提供事件接口
        - 说明如何显示事件视图控制器，以允许用户创建和编辑事件
        https://developer.apple.com/library/content/documentation/DataManagement/Conceptual/EventKitProgGuide/UsingEventViewControllers.html#//apple_ref/doc/uid/TP40009765-CH2-SW4

 
 */






#pragma mark - 官方指南


/*
 
    1.EventKit框架
    https://developer.apple.com/documentation/eventkit
 
 
 
    2.日历和提醒编程指南
    https://developer.apple.com/library/content/documentation/DataManagement/Conceptual/EventKitProgGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40009765
 */











