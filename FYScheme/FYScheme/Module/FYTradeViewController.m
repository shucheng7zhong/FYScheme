//
//  FYTradeViewController.m
//  FYScheme
//
//  Created by fangYong on 17/8/14.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "FYTradeViewController.h"
#import "DepositViewController.h"
#import "EncashViewController.h"
#import "FYAssetViewController.h"
@implementation FYTradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createContentView];
}

- (void)createContentView {
    
    UIButton *depositButton = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 40, 150, 80, 40)];
    [depositButton setTitle:@"存入" forState:UIControlStateNormal];
    depositButton.backgroundColor = [UIColor colorWithHex:@"f03456"];
    depositButton.layer.cornerRadius = 8;
    [depositButton addTarget:self action:@selector(depositClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:depositButton];
    
    UIButton *encashButton = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 40, 210, 80, 40)];
    [encashButton setTitle:@"取现" forState:UIControlStateNormal];
    encashButton.backgroundColor = [UIColor colorWithHex:@"f03456"];
    encashButton.layer.cornerRadius = 8;
    [encashButton addTarget:self action:@selector(encashClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:encashButton];
    
    UIButton *assetButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(encashButton.frame), CGRectGetMaxY(encashButton.frame) + 20, 80, 40)];
    [assetButton setTitle:@"资产" forState:UIControlStateNormal];
    assetButton.backgroundColor = [UIColor colorWithHex:@"f03456"];
    assetButton.layer.cornerRadius = 8;
    [assetButton addTarget:self action:@selector(assetClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:assetButton];

    
}

- (void)depositClick {
    
    DepositViewController *vc = [DepositViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)encashClick {
    
    EncashViewController *vc = [EncashViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)assetClick {
    
    FYAssetViewController *vc = [FYAssetViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
