//
//  UIColor+hex.m
//  FYScheme
//
//  Created by fangYong on 17/8/14.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import "UIColor+hex.h"

const NSInteger MAX_RGB_COLOR_VALUE = 0xff;
const NSInteger MAX_RGB_COLOR_VALUE_FLOAT = 255.0f;

@implementation UIColor (hex)

+ (UIColor*)colorWithHex:(NSString *)hexValue{
    
    unsigned int c;
    if ([hexValue characterAtIndex:0] == '#') {
        
        [[NSScanner scannerWithString:[hexValue substringFromIndex:1]] scanHexInt:&c];
        
    } else {
        
        [[NSScanner scannerWithString:hexValue] scanHexInt:&c];
    }
    return [UIColor colorWithRed:((c & 0xff0000) >> 16)/255.0f green:((c & 0xff00) >> 8)/255.0f blue:(c & 0xff)/255.0f alpha:1.0];
    
}

@end
