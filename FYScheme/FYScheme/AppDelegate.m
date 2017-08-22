//
//  AppDelegate.m
//  FYScheme
//
//  Created by fangYong on 17/7/27.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "AppDelegate.h"
#import "FYTradeViewController.h"
#import "FYAssetViewController.h"
#import "FYExtraViewController.h"
#import "FYSchemeManager.h"
#import "FYSchemeConstants.h"
#import "SchemeUtils.h"
@interface AppDelegate ()<FYSchemeNavigationDelegate>
{
    UITabBarController *_tabBarController;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    [SchemeUtils setup];
    [[FYSchemeManager shareInstance] setNavigationDelegate:self];
    [[FYSchemeManager shareInstance] setScheme:FYSCHEME_SCHEME];

    [self createRootViewController];
    self.window.rootViewController = _tabBarController;
    return YES;
}


- (void)createRootViewController {
    
    UITabBarItem *item;
    FYTradeViewController *vc1 = [FYTradeViewController new];
    item = [vc1.tabBarItem initWithTitle:@"Trade" image:[UIImage imageNamed:@"fund"] selectedImage:[UIImage imageNamed:@"Hfund"]];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    
    FYAssetViewController *vc2 = [FYAssetViewController new];
    item = [vc2.tabBarItem initWithTitle:@"Asset" image:[UIImage imageNamed:@"fund"] selectedImage:[UIImage imageNamed:@"Hassets"]];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    
    FYExtraViewController *vc3 = [FYExtraViewController new];
    item = [vc3.tabBarItem initWithTitle:@"Extra" image:[UIImage imageNamed:@"my"] selectedImage:[UIImage imageNamed:@"Hmy"]];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    
    _tabBarController = [[UITabBarController alloc]init];
    _tabBarController.viewControllers = [NSArray arrayWithObjects:nav1,nav2,nav3,nil];
    _tabBarController.selectedIndex = 0;
    _tabBarController.tabBar.tintColor = [UIColor colorWithRed:197/255.0 green:55/255.0 blue:60/255.0 alpha:1];
    _tabBarController.tabBar.barTintColor = [UIColor whiteColor];

    
}

-(UINavigationController *)currentNavigationController {
    
    if (_tabBarController) {
        return _tabBarController.selectedViewController;
    }else {
        return nil;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
