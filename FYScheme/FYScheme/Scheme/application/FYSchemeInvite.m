//
//  FYSchemeInvite.m
//  FYScheme
//
//  Created by fangYong on 17/8/8.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "FYSchemeInvite.h"
#import "InvitationViewController.h"
@implementation FYSchemeInvite

- (BOOL)invokeWithParamters:(NSDictionary *)paramters navigationController:(UINavigationController *)navigationController {
    
    InvitationViewController *vc = [InvitationViewController new];
    [navigationController pushViewController:vc animated:YES];
    return YES;
}
@end
