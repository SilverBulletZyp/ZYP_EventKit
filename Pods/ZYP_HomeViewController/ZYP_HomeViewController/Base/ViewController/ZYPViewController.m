//
//  ZYPViewController.m
//  ZYP_HomeController
//
//  Created by zhaoyunpeng on 2017/7/3.
//  Copyright © 2017年 zhaoyunpeng. All rights reserved.
//

#import "ZYPViewController.h"
#import "ZYPBaseViewController.h"

@interface ZYPViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *array;
@end

@implementation ZYPViewController

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.title = title;
    }
    return self;
}

- (NSArray *)array {
    if (!_array) {
        _array = [[NSArray alloc]init];
    }
    return _array;
}

- (void)setVCArray:(NSArray *)array {
    self.array = array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title = @"back";
    self.navigationItem.backBarButtonItem = backButtonItem;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count>0?self.array.count:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.textLabel.text = self.array[indexPath.row]?self.array[indexPath.row][@"name"]:@"";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (self.array.count > indexPath.row) {
        NSString *vcClassName = self.array[indexPath.row][@"vc"];
        Class vcClass = NSClassFromString(vcClassName);
        if (vcClass) {
            ZYPBaseViewController *vc = [[vcClass alloc]init];
            vc.classTitle = self.array[indexPath.row][@"name"];
            vc.className = self.array[indexPath.row][@"vc"];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}


@end
