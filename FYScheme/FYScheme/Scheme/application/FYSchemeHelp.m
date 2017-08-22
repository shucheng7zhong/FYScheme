//
//  FYSchemeHelp.m
//  FYScheme
//
//  Created by fangYong on 17/8/14.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "FYSchemeHelp.h"
#import "FYSchemeHelpViewController.h"

@implementation FYSchemeHelp

- (BOOL)invokeWithParamters:(NSDictionary *)paramters navigationController:(UINavigationController *)navigationController {
    
    FYSchemeHelpViewController *vc = [FYSchemeHelpViewController new];
    [navigationController pushViewController:vc animated:YES];
    return YES;
}

@end
