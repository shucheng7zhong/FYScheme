//
//  FYSchemeManager.h
//  FYScheme
//
//  Created by fangYong on 17/8/7.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol FYSchemeNavigationDelegate <NSObject>
- (nullable UINavigationController *)currentNavigationController;
@end

@class FYSchemeHostHandler;
@interface FYSchemeManager : NSObject

@property (nullable,weak, nonatomic) id<FYSchemeNavigationDelegate> navigationDelegate;

+ (nullable instancetype)shareInstance;
/**
 判断当前传入的url是否合法，是否有必要继续Scheme操作

 @param urlString 自定义格式的url
 */
- (BOOL)canOpenUrl:(nonnull NSString*)urlString;


/**
 打开url，处理url的相关操作，比如进入某个页面，调起某个时间

 @param urlString 自定义格式的url
 */
- (void)openUrl:(nonnull NSString*)urlString;


/**
 注册host

 @param handler FYSchemeHostHandler
 @param host    自定义的host
 */
- (void)registerHandler:(nullable FYSchemeHostHandler*)handler forHost:(nonnull NSString *)host;

- (void)setNavigationController:(nullable UINavigationController *)navigationController;

- (void)setScheme:(nonnull NSString*)scheme;

@end
