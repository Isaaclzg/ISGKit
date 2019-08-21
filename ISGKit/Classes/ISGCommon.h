//
//  ISGCommon.h
//  ZJServer
//
//  Created by isaac on 16/5/27.
//  Copyright © 2016年 ultrapower. All rights reserved.
//

#ifndef ISGCommon_h
#define ISGCommon_h

/*! @brief iOS版本 */
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

// 获取应用的bundle id
#define kBundleID           [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"]

// 获取物理屏幕宽度
#define  kScreenWidth       [UIScreen  mainScreen].bounds.size.width

// 获取物理屏幕高度
#define  kScreenHeight      [UIScreen  mainScreen].bounds.size.height

//设备版本
#define iPhone4 (480.0 == kScreenHeight)
#define iPhone5 (568.0 == kScreenHeight)
#define iPhone6 (667.0 == kScreenHeight)
#define iPhone6P (736.0 == kScreenHeight)

#define IS_ScreenWidthScale kScreenWidth/750
#define IS_ScreenHeightScale kScreenHeight/1334

// JSON
#define ISJson(data) [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]

#define ISGPlaceholderImage [UIImage imageNamed:@"morentu"]

// 判断是否是iPhone X
#define iPhoneX (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 812))) || (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(414, 896)))
// 状态栏高度
#define kStatusBarHeight (iPhoneX ? 44.f : 20.f)
// 导航栏高度
#define kNavgationHeight (iPhoneX ? 88.f : 64.f)
// tabBar高度
#define kTabbarHeight (iPhoneX ? (49.f+34.f) : 49.f)
// home indicator高度
#define kHone_indicator_height (iPhoneX ? 34.f : 0.f)


// ios11

/*
#define  adjustsScrollViewInsets(scrollView)\
do {\
_Pragma("clang diagnostic push")\
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")\
if ([scrollView respondsToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
NSMethodSignature *signature = [UIScrollView instanceMethodSignatureForSelector:@selector(setContentInsetAdjustmentBehavior:)];\
NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];\
NSInteger argument = 2;\
invocation.target = scrollView;\
invocation.selector = @selector(setContentInsetAdjustmentBehavior:);\
[invocation setArgument:&argument atIndex:2];\
[invocation retainArguments];\
[invocation invoke];\
}\
_Pragma("clang diagnostic pop")\
} while (0)

#ifdef __IPHONE_11_0

if ([tableView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
    tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
}

#endif
*/
#endif /* ISGCommon_h */
