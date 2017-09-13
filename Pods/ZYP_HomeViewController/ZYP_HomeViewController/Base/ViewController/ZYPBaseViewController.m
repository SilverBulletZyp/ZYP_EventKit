//
//  ZYPBaseViewController.m
//  ZYP_HomeController
//
//  Created by zhaoyunpeng on 2017/7/3.
//  Copyright © 2017年 zhaoyunpeng. All rights reserved.
//

#define ZYPLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])

#import "ZYPBaseViewController.h"

@interface ZYPBaseViewController ()

@end

@implementation ZYPBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.classTitle;
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:self.button];
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 120)/2, (self.view.frame.size.width - 60)/2, 120, 60)];
        _button.titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
        [_button setTitle:@"button" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_button setBackgroundColor:[UIColor redColor]];
        [_button addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_button setShowsTouchWhenHighlighted:YES];
    }
    return _button;
}

- (void)onClickButton:(UIButton *)button {
    ZYPLog(@"");
}

- (void)dealloc {
    ZYPLog(@"- [%@ dealloc] -",self.className);
}

@end
