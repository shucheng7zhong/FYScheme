//
//  EncashViewController.m
//  FYScheme
//
//  Created by fangYong on 17/8/14.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "EncashViewController.h"

@interface EncashViewController ()

@end

@implementation EncashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"取现";
    
    // Do any additional setup after loading the view.
}

- (NSString *)whereString {
    
    return @"这里是取现";
}


- (void)createContentView {
    
    UILabel *fundNameLabel = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 80, 200, 160, 40)];
    fundNameLabel.backgroundColor = [UIColor colorWithHex:@"f03456"];
    if (self.fundName) {
        fundNameLabel.text = [NSString stringWithFormat:@"基金名称:%@",self.fundName];
    }
    [self.view addSubview:fundNameLabel];
    
    UILabel *fundCodeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(fundNameLabel.frame), CGRectGetMaxY(fundNameLabel.frame) + 20, 160, 40)];
    fundCodeLabel.backgroundColor = [UIColor colorWithHex:@"f03456"];
    if (self.fundCode) {
        fundCodeLabel.text = [NSString stringWithFormat:@"基金代码:%@",self.fundCode];
    }
    [self.view addSubview:fundCodeLabel];
}

@end
