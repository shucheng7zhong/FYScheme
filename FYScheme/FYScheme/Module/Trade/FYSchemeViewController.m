//
//  FYTradeViewController.m
//  FYScheme
//
//  Created by fangYong on 17/8/14.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "FYSchemeViewController.h"
#import "FYSchemeManager.h"
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface FYSchemeViewController ()<UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) UITextView *schemeTextView;

@property (strong, nonatomic) NSArray *schemeDataArray;

@property (strong, nonatomic) NSArray *schemeTitleArray;

@end

@implementation FYSchemeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createContentView];
}

- (NSArray *)schemeDataArray {
    
    if (!_schemeDataArray) {
        
        _schemeDataArray = [NSArray arrayWithObjects:@"trade/deposit",@"trade/encash",@"asset/home",@"asset/fundHoldings",@"extra/invite",@"extra/help", nil];
    }
    return _schemeDataArray;
}

- (NSArray *)schemeTitleArray {
    
    if (!_schemeTitleArray) {
        
        _schemeTitleArray = [NSArray arrayWithObjects:@"存钱",@"取钱",@"主页",@"产品展示",@"邀请好友",@"在线帮助", nil];
    }
    return _schemeTitleArray;
}

- (void)createContentView {
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT/3)];
    headerView.backgroundColor = [UIColor colorWithHex:@"d8dfe6"];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    UITextView *schemeTextView = [[UITextView alloc]initWithFrame:CGRectMake(30, 100, 300, 60)];
    schemeTextView.backgroundColor = [UIColor whiteColor];
    schemeTextView.text = @"请输入scheme";
    schemeTextView.layer.borderWidth = 0.5;
    schemeTextView.font = [UIFont systemFontOfSize:14];
    schemeTextView.layer.borderColor = [UIColor blackColor].CGColor;
    schemeTextView.delegate = self;
    [headerView addSubview:schemeTextView];
    _schemeTextView = schemeTextView;
    
    UIButton *schemeButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 70, 30)];
    schemeButton.center = CGPointMake(SCREEN_WIDTH/2, CGRectGetMaxY(schemeTextView.frame) + 30);
    [schemeButton setTitle:@"GO！" forState:UIControlStateNormal];
    schemeButton.layer.cornerRadius = 8.0;
    schemeButton.backgroundColor = [UIColor colorWithHex:@"f03456"];
    [schemeButton addTarget:self action:@selector(schemeClick) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:schemeButton];
    
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    tableView.bounces = YES;
    tableView.tableHeaderView = headerView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.schemeDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"schemeIdentifierString";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ fyscheme://%@",self.schemeTitleArray[indexPath.row],self.schemeDataArray[indexPath.row]];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [[FYSchemeManager shareInstance]openUrl:[NSString stringWithFormat:@"fyscheme://%@",self.schemeDataArray[indexPath.row]]];
}

- (void)schemeClick {
    
    [[FYSchemeManager shareInstance]openUrl:_schemeTextView.text];
}
@end
