//
//  FYSchemeEncash.m
//  FYScheme
//
//  Created by fangYong on 17/8/22.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "FYSchemeEncash.h"
#import "EncashViewController.h"
@implementation FYSchemeEncash

- (BOOL)invokeWithParamters:(NSDictionary *)paramters navigationController:(UINavigationController *)navigationController {
    
    EncashViewController *vc = [EncashViewController new];
    [navigationController pushViewController:vc animated:YES];
    return YES;
}

@end
