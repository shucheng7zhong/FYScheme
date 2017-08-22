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
#import "FYSchemeSubscribe.h"
#import "FYSchemeMyasset.h"
@implementation SchemeUtils

+ (void)setup {
    
    [[FYSchemeManager shareInstance] registerHandler:[SchemeUtils extraHandler] forHost:SCHEME_HOST_EXTRA];
    [[FYSchemeManager shareInstance] registerHandler:[SchemeUtils tradeHandler] forHost:SCHEME_HOST_TRADE];
    [[FYSchemeManager shareInstance] registerHandler:[SchemeUtils assetHandler] forHost:SCHEME_HOST_ASSET];
}

+ (FYSchemeHostHandler *)extraHandler {
    
    FYSchemeHostHandler *handler = [FYSchemeHostHandler new];
    [handler registerPathHandler:[[FYSchemeInvite alloc]init] forPath:SCHEME_PATH_INVITE];
    return handler;
}

+ (FYSchemeHostHandler *)tradeHandler {
    
    FYSchemeHostHandler *handler = [FYSchemeHostHandler new];
    [handler registerPathHandler:[FYSchemePurschase new] forPath:SCHEME_PATH_HQTPURCHASE];
    [handler registerPathHandler:[FYSchemeSubscribe new] forPath:SCHEME_PATH_SUBSCRIBE];
    return handler;
}

+ (FYSchemeHostHandler *)assetHandler {
    
    FYSchemeHostHandler *handler = [FYSchemeHostHandler new];
    [handler registerPathHandler:[FYSchemeMyasset new] forPath:SCHEME_PATH_ASSETHOME];
    return handler;
}
@end
