//
//  FYSchemeHelp.m
//  FYScheme
//
//  Created by fangYong on 17/8/14.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "FYSchemeHelp.h"
#import "HelpViewController.h"
@implementation FYSchemeHelp

- (BOOL)invokeWithParamters:(NSDictionary *)paramters navigationController:(UINavigationController *)navigationController {
    
    HelpViewController *vc = [HelpViewController new];
    [navigationController pushViewController:vc animated:YES];
    return YES;
}

@end
