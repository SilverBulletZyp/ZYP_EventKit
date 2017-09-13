//
//  ZYPBaseViewController.h
//  ZYP_HomeController
//
//  Created by zhaoyunpeng on 2017/7/3.
//  Copyright © 2017年 zhaoyunpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYPBaseViewController : UIViewController

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, copy) NSString *classTitle;
@property (nonatomic, copy) NSString *className;
- (void)onClickButton:(UIButton *)button;

@end
