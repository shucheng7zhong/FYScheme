//
//  FYSchemeHostHandler.m
//  FYScheme
//
//  Created by fangYong on 17/8/7.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "FYSchemeHostHandler.h"
#import "FYSchemePathHandler.h"

@interface FYSchemeHostHandler()

@property (strong, nonatomic) NSMutableDictionary<NSString *,FYSchemePathHandler *> *supportedPaths;

@end
@implementation FYSchemeHostHandler

- (BOOL)canOpenPathInUrl:(NSURL *)url {
    
    NSString *path = [url path];
    if (!path || path.length == 0) {
        
        return NO;
    }
    
    id handler = [self.supportedPaths objectForKey:path];
    if (handler && [handler respondsToSelector:@selector(validatePathInUrl:)]) {
        
        [handler validatePathInUrl: url];
    }else {
        
        return NO;
    }
    return YES;
}

- (BOOL)openUrl:(NSURL *)url navigationController:(UINavigationController *)navigationController {
    
    if ([self canOpenPathInUrl:url]) {
        
        return [[self.supportedPaths objectForKey:[url path]] openUrl:url navigationController:navigationController];
    }else {
        
        return NO;
    }
}

- (NSMutableDictionary<NSString *,FYSchemePathHandler *> *)supportedPaths {
    
    if (!_supportedPaths) {
        
        _supportedPaths = [NSMutableDictionary dictionary];
    }
    return _supportedPaths;
}

- (void)registerPathHandler:(FYSchemePathHandler *)handler forPath:(NSString *)path {
    
    if (handler && path) {
        [self.supportedPaths setObject:handler forKey:path];
    }
    
}
@end
