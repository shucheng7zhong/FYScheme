//
//  FYSchemeConstants.h
//  FYScheme
//
//  Created by fangYong on 17/8/7.
//  Copyright © 2017年 fangYong. All rights reserved.
//

#import <Foundation/Foundation.h>

//根据需要设定自己的scheme
#define FYSCHEME_SCHEME @"fyscheme"
//fyscheme://trade/invite
//------------支持的 hosts ----------
#define SCHEME_HOST_EXTRA @"extra"
#define SCHEME_HOST_TRADE @"trade"


//------------ extra -------------
#define SCHEME_PATH_INVITE @"/invite"
#define SCHEME_PATH_HELP @"/help"

//browse
#define SCHEME_PATH_BROWSE @"/browse"
#define SCHEME_PATH_BROWSEL @"/browseL"
#define SCHEME_PATH_LOGINBROWSE @"/loginBrowse"
#define KEY_BROWSE_URL @"url"
#define KEY_BROWSE_TITLE @"title"
#define KEY_BROWSE_FUNC @"func"


//------------ trade -------------
#define SCHEME_PATH_HQTPURCHASE @"/deposit"
#define SCHEME_PATH_HQTREDEEM @"/encash"

@interface FYSchemeConstants : NSObject

@end
