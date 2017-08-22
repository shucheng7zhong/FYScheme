//
//  FYBaseViewController.m
//  FYScheme
//
//  Created by fangYong on 17/8/22.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "FYBaseViewController.h"

@interface FYBaseViewController ()

@end

@implementation FYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createContentView];
}

- (void)createContentView {
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 60, 200, 120, 40)];
    [button setTitle:[self whereString] forState:UIControlStateNormal];
    button.layer.cornerRadius = 8;
    [button setBackgroundColor:[UIColor colorWithHex:@"f03456"]];
    [self.view addSubview:button];
}

- (NSString *)whereString {
    
    return @"";
}

@end
