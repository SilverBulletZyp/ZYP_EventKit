//
//  AppDelegate.m
//  ZYP_EventKit
//
//  Created by 赵云鹏 on 2017/9/13.
//  Copyright © 2017年 赵云鹏. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<iConsoleDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 权限获取
    // EKEntityTypeEvent日历事件 ,   EKEntityTypeReminder提醒事项
    
    //获取授权状态
    EKAuthorizationStatus eventStatus = [EventStore authorizationStatusForEntityType:EKEntityTypeEvent];
    if (eventStatus ==EKAuthorizationStatusNotDetermined) {
        if ([[EventStore shareManager]respondsToSelector:@selector(requestAccessToEntityType:completion:)]) {
            [[EventStore shareManager]requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (granted) {
                        NSLog(@"已获得日历权限");
                    }
                    else {
                        
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"calshow:"]];
                    }
                });
            }];
        }
    }
    else if (eventStatus == EKAuthorizationStatusDenied) {
        NSLog(@"当前日历服务不可用");
    }
    else if (eventStatus == EKAuthorizationStatusAuthorized) {
        NSLog(@"用户已经授权");
    }
    else {
        // EKAuthorizationStatusRestricted
        NSLog(@"当前日历服务不可用");
    }

    
    
    NSArray *array = @[@{@"name":@"01 框架简介",@"vc":@"IntroductionVC"},
                       @{@"name":@"02 阅读和写作日历活动",@"vc":@"ReadingAndWriting"},];
    ZYPNavigationController *nav = [[ZYPNavigationController alloc]initWithTitle:@"系统事件库" vcArray:array];
    self.window = [[iConsoleWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
   
    [iConsole sharedConsole].delegate = self;
//    [iConsole sharedConsole].simulatorTouchesToShow = YES;
    [iConsole clear];
//    [iConsole show];
    
    return YES;
}

- (void)handleConsoleCommand:(NSString *)command
{
    if ([command isEqualToString:@"version"])
    {
        [iConsole info:@"%@ version %@",
         [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"],
         [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]];
    }
    else
    {
        [iConsole error:@"unrecognised command, try 'version' instead"];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
