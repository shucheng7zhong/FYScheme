//
//  FYTradeViewController.m
//  FYScheme
//
//  Created by fangYong on 17/8/14.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "FYTradeViewController.h"
#import "FYSchemeManager.h"
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface FYTradeViewController ()<UITextViewDelegate>

@property (weak, nonatomic) UITextView *schemeTextView;

@end

@implementation FYTradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createContentView];
}

- (void)createContentView {
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT/3)];
    headerView.backgroundColor = [UIColor colorWithHex:@"d8dfe6"];
    [self.view addSubview:headerView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    UITextView *schemeTextView = [[UITextView alloc]initWithFrame:CGRectMake(30, 100, 300, 60)];
    schemeTextView.backgroundColor = [UIColor whiteColor];
    schemeTextView.text = @"请输入scheme";
    schemeTextView.layer.borderWidth = 0.5;
    schemeTextView.font = [UIFont systemFontOfSize:14];
    schemeTextView.layer.borderColor = [UIColor blackColor].CGColor;
    schemeTextView.delegate = self;
    [self.view addSubview:schemeTextView];
    _schemeTextView = schemeTextView;
    
    UIButton *schemeButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 70, 30)];
    schemeButton.center = CGPointMake(SCREEN_WIDTH/2, CGRectGetMaxY(schemeTextView.frame) + 30);
    [schemeButton setTitle:@"GO！" forState:UIControlStateNormal];
    schemeButton.layer.cornerRadius = 8.0;
    schemeButton.backgroundColor = [UIColor colorWithHex:@"f03456"];
    [schemeButton addTarget:self action:@selector(schemeClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:schemeButton];
    
    
    UIButton *depositButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 35, CGRectGetMaxY(headerView.frame) + 30, 70, 30)];
    [depositButton setTitle:@"存钱" forState:UIControlStateNormal];
    depositButton.backgroundColor = [UIColor colorWithHex:@"f03456"];
    depositButton.layer.cornerRadius = 8.0;
    [self.view addSubview:depositButton];
    [depositButton addTarget:self action:@selector(depositClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *encashButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 35, CGRectGetMaxY(depositButton.frame) + 20, 70, 30)];
    [encashButton setTitle:@"取钱" forState:UIControlStateNormal];
    encashButton.backgroundColor = [UIColor colorWithHex:@"f03456"];
    encashButton.layer.cornerRadius = 8.0;
    [self.view addSubview:encashButton];
    [encashButton addTarget:self action:@selector(encashClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}


- (void)schemeClick {
    
    [[FYSchemeManager shareInstance]openUrl:_schemeTextView.text];
}

- (void)depositClick {
    
    
}

- (void)encashClick {
    
    
}

@end
