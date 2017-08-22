//
//  FYSchemePathHandler.m
//  FYScheme
//
//  Created by fangYong on 17/8/7.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "FYSchemePathHandler.h"
static NSString const *urlKey = @"url";

@implementation FYSchemePathHandler

- (BOOL)validatePathInUrl:(NSURL *)url {
    NSDictionary *dic = [[self class] paramtersOfUrlQueryFromUrl:url];
    return [self validateParamters:dic];
}

- (BOOL)openUrl:(nonnull NSURL *)url navigationController:(nullable UINavigationController *)nav {
    if ([self validatePathInUrl:url]) {
        
        NSMutableDictionary *dic = [[[self class] paramtersOfUrlQueryFromUrl:url] mutableCopy];
        NSDictionary *defaultDic = [self defaultParamters];
        
        for (NSString *key in defaultDic.allKeys) {
            if (![dic objectForKey:key]) {
                [dic setObject:[defaultDic objectForKey:key] forKey:key];
            }
        }
        return [self invokeWithParamters:dic navigationController:nav];        
    }
    else {
        return NO;
    }
}

//子类实现
- (BOOL)validateParamters:(nullable NSDictionary *)paramters {
    
    return YES;
}

//子类实现
- (BOOL)invokeWithParamters:(nullable NSDictionary *)paramters navigationController:(nullable UINavigationController *)navigationController {
    
    return NO;
}

//NSURL参数-->字典
+ (NSDictionary *)paramtersOfUrlQueryFromUrl:(NSURL *)url {
    
    NSMutableDictionary * tempDict = [NSMutableDictionary dictionary];
    NSString * urlQuery = [[url query] stringByRemovingPercentEncoding];
    
    //处理url参数 (约定url参数如果存在，就必须为最后一个参数)
    NSRange range = [urlQuery rangeOfString:[urlKey stringByAppendingString:@"="]];
    if (range.location != NSNotFound) {
        //取出url参数
        NSString *urlVaule = [urlQuery substringFromIndex:(range.location + range.length)];
        if (urlVaule.length > 0) {
            if (![NSURL URLWithString:urlVaule]) {
                urlVaule = [urlVaule stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            }
            [tempDict setObject:urlVaule forKey:@"url"];
        }
        if (range.location > 0) {
            urlQuery = [urlQuery substringToIndex:(range.location-1)];
            //如果最后一个是&，也干掉
            if ([urlQuery hasSuffix:@"&"]) {
                urlQuery = [urlQuery substringToIndex:([urlQuery length] - 1)];
            }
        }
        else {
            urlQuery = @"";
        }
    }
    
    NSArray * keyAndValues = [urlQuery componentsSeparatedByString:@"&"];
    
    for (NSString * keyAndValue in keyAndValues) {
        
        NSArray * keyValue = [keyAndValue componentsSeparatedByString:@"="];
        if ([keyValue count] ==2) {
            NSString * key = [keyValue firstObject];
            NSString * value = [keyValue lastObject];
            [tempDict setObject:value forKey:key];
        }
    }
    
    if ([tempDict allKeys] ==0) {
        
        return nil;
    }
    else {
        return tempDict;
    }
}

//有需要自带参数的子类实现
- (nullable NSDictionary<NSString *, NSString *> *)defaultParamters {
    return nil;
}


@end
