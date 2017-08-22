//
//  FYSchemeManager.m
//  FYScheme
//
//  Created by fangYong on 17/8/7.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "FYSchemeManager.h"
#import "FYSchemeHostHandler.h"
@interface FYSchemeManager()

@property (copy, nonatomic) NSString *scheme;
@property (strong, nonatomic) NSMutableDictionary<NSString *,FYSchemeHostHandler *> *supportedHosts;
@property (nonatomic, weak) UINavigationController *navigationController;
@end

@implementation FYSchemeManager

static FYSchemeManager *_instance;

+ (id)allocWithZone:(struct _NSZone *)zone {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype)shareInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (BOOL)canOpenUrl:(NSString *)urlSring {
    
    NSURL *url = [self urlFromString:urlSring];
    if (!url) {
        
        return NO;
    }else if (![[url scheme] isEqualToString:self.scheme]){
        
        return [[UIApplication sharedApplication] canOpenURL:url];
        
    }else{
        
        NSString *host = [url host];
        if (!host || [host length] == 0) {
            
            return NO;
        }else {
            
            id handler = [self.supportedHosts objectForKey:host];
            if (handler && [handler respondsToSelector:@selector(canOpenPathInUrl:)]) {
                
               return  [handler canOpenPathInUrl:url];
            }else {
                
                return YES;
            }
        }
    }
}

- (void)openUrl:(NSString *)urlString {
    
    if ([self canOpenUrl:urlString]) {
        NSURL *url = [self urlFromString:urlString];
        [[self.supportedHosts objectForKey:[url host]] openUrl:url navigationController:[self properNavigationController]];
    }
}

- (NSMutableDictionary<NSString *,FYSchemeHostHandler*> *)supportedHosts {
    
    if (!_supportedHosts) {
        _supportedHosts = [NSMutableDictionary dictionary];
    }
    return _supportedHosts;
}

//注册host
- (void)registerHandler:(FYSchemeHostHandler *)handler forHost:(NSString *)host {
    
    if (handler && host) {
        
        [self.supportedHosts setObject:handler forKey:host];
    }
}

//NSString -->NSURL
- (NSURL *)urlFromString:(NSString *)string {
    
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSURL *url = [NSURL URLWithString:string];
    if (!url) {
        
        NSString *percentString = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        url = [NSURL URLWithString:percentString];
    }
    return url;
}

//获取navigationController
- (UINavigationController *)properNavigationController {
    if (self.navigationController) {
        return self.navigationController;
    }
    else if (self.navigationDelegate && [self.navigationDelegate respondsToSelector:@selector(currentNavigationController)]){
        return [self.navigationDelegate currentNavigationController];
    }
    else {
        return nil;
    }
}

- (void)setScheme:(nonnull NSString *)scheme {
    
    _scheme = scheme;
}

@end
