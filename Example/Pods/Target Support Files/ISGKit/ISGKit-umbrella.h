#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "ISGKit.h"
#import "ISGTools.h"
#import "NSBundle+ISGCategory.h"
#import "NSString+ISGCategory.h"
#import "UIColor+ISGCategory.h"
#import "UIImage+ISGCategory.h"
#import "UIView+ISGCategory.h"

FOUNDATION_EXPORT double ISGKitVersionNumber;
FOUNDATION_EXPORT const unsigned char ISGKitVersionString[];

