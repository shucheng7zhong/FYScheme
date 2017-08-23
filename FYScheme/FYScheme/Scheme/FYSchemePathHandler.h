//
//  FYSchemePathHandler.h
//  FYScheme
//
//  Created by fangYong on 17/8/7.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYSchemeConstants.h"
#import <UIKit/UIKit.h>

@protocol FYSchemeDataSource <NSObject>

@required
- (BOOL)validateParamters:(nullable NSDictionary *)paramters;
- (BOOL)invokeWithParamters:(nullable NSDictionary *)paramters navigationController:(nullable UINavigationController *)navigationController;
@end


@interface FYSchemePathHandler : NSObject<FYSchemeDataSource>

- (BOOL)validatePathInUrl:(nonnull NSURL *)url;

- (BOOL)openUrl:(nonnull NSURL *)url navigationController:(nullable UINavigationController *)navigationController;

- (nullable NSDictionary<NSString *, NSString *> *)defaultParamters;

+ (nullable NSDictionary *)paramtersOfUrlQueryFromUrl:(nonnull NSURL *)url;


@end
