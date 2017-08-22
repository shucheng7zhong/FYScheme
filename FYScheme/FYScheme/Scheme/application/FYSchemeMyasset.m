//
//  FYSchemeMyasset.m
//  FYScheme
//
//  Created by fangYong on 17/8/8.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "FYSchemeMyasset.h"
#import "MyAssetViewController.h"
@implementation FYSchemeMyasset

- (BOOL)invokeWithParamters:(NSDictionary *)paramters navigationController:(UINavigationController *)navigationController {
    
    MyAssetViewController *vc = [MyAssetViewController new];
    [navigationController pushViewController:vc animated:YES];
    return YES;
}

@end
