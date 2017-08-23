//
//  SchemeUtils.m
//  FYScheme
//
//  Created by fangYong on 17/8/7.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "SchemeUtils.h"
#import "FYSchemeManager.h"
#import "FYSchemeHostHandler.h"
#import "FYSchemePathHandler.h"
#import "FYSchemeConstants.h"
#import "FYSchemeInvite.h"
#import "FYSchemePurschase.h"
#import "FYSchemeEncash.h"
#import "FYSchemeHelp.h"
@implementation SchemeUtils
+ (void)setup {
    
    [[FYSchemeManager shareInstance] registerHandler:[SchemeUtils extraHandler] forHost:SCHEME_HOST_EXTRA];
    [[FYSchemeManager shareInstance] registerHandler:[SchemeUtils tradeHandler] forHost:SCHEME_HOST_TRADE];
}


/**
 注册APP各个Host模块的子模块，对应自定义URL的Path
 */
+ (FYSchemeHostHandler *)extraHandler {
    
    FYSchemeHostHandler *handler = [FYSchemeHostHandler new];
    [handler registerPathHandler:[[FYSchemeHelp alloc]init] forPath:SCHEME_PATH_HELP];
    [handler registerPathHandler:[[FYSchemeInvite alloc]init] forPath:SCHEME_PATH_INVITE];
    return handler;
}

+ (FYSchemeHostHandler *)tradeHandler {
    
    FYSchemeHostHandler *handler = [FYSchemeHostHandler new];
    [handler registerPathHandler:[FYSchemePurschase new] forPath:SCHEME_PATH_HQTPURCHASE];
    [handler registerPathHandler:[FYSchemeEncash new] forPath:SCHEME_PATH_HQTREDEEM];
    return handler;
}

@end
