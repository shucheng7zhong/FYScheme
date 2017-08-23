//
//  FYExtraViewController.m
//  FYScheme
//
//  Created by fangYong on 17/8/14.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "FYExtraViewController.h"
#import "InvitationViewController.h"
#import "HelpViewController.h"
@interface FYExtraViewController ()

@end

@implementation FYExtraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createContentView];
}

- (void)createContentView {
    
    UIButton *depositButton = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 40, 150, 80, 40)];
    [depositButton setTitle:@"在线帮助" forState:UIControlStateNormal];
    depositButton.backgroundColor = [UIColor colorWithHex:@"f03456"];
    depositButton.layer.cornerRadius = 8;
    [depositButton addTarget:self action:@selector(helpClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:depositButton];
    
    UIButton *encashButton = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 40, 210, 80, 40)];
    [encashButton setTitle:@"邀请好友" forState:UIControlStateNormal];
    encashButton.backgroundColor = [UIColor colorWithHex:@"f03456"];
    encashButton.layer.cornerRadius = 8;
    [encashButton addTarget:self action:@selector(inviteClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:encashButton];
    
}

- (void)helpClick {
    
    HelpViewController *vc = [HelpViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)inviteClick {
    
    InvitationViewController *vc = [InvitationViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
