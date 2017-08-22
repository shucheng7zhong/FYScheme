//
//  FYSchemeHostHandler.h
//  FYScheme
//
//  Created by fangYong on 17/8/7.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class FYSchemePathHandler;
@interface FYSchemeHostHandler : NSObject

- (BOOL)canOpenPathInUrl:(NSURL *)url;
- (BOOL)openUrl:(NSURL *)url navigationController:(UINavigationController *)navigationController;
- (void)registerPathHandler:(FYSchemePathHandler *)handler forPath:(NSString *)path;

@end
