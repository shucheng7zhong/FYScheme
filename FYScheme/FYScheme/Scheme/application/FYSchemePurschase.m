//
//  FYSchemePurschase.m
//  FYScheme
//
//  Created by fangYong on 17/8/8.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "FYSchemePurschase.h"
#import "DepositViewController.h"

@implementation FYSchemePurschase

- (BOOL)invokeWithParamters:(NSDictionary *)paramters navigationController:(UINavigationController *)navigationController {
    
    DepositViewController *vc = [DepositViewController new];
    [navigationController pushViewController:vc animated:YES];
    return YES;
}
@end
