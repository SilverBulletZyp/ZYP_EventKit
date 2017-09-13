//
//  ZYPNavigationController.m
//  ZYP_HomeViewController
//
//  Created by 赵云鹏 on 2017/8/8.
//  Copyright © 2017年 赵云鹏. All rights reserved.
//

#import "ZYPNavigationController.h"
#import "ZYPViewController.h"

@interface ZYPNavigationController ()

@end

@implementation ZYPNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (instancetype)initWithTitle:(NSString *)title vcArray:(NSArray *)array {
    ZYPViewController *vc = [[ZYPViewController alloc]initWithTitle:title];
    [vc setVCArray:array];
    
    self = [super initWithRootViewController:vc];
    if (self) {
        
    }
    return self;
}

@end
