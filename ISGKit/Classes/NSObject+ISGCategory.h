//
//  NSObject+ISGCategory.h
//  ISGKit
//
//  Created by Mac on 2024/6/1.
//

#import <Foundation/Foundation.h>

@interface NSObject (ISGCategory)

/// hook 实例方法
/// @param targetCls 需要被 hook 的类
/// @param currentCls 自己的实现方法所在的类
/// @param targetSelector 目标方法
/// @param currentSelector 准备替换目标方法
+ (void)zg_hookInstanceMethodWithTargetCls:(Class)targetCls
                             currentCls:(Class)currentCls
                         targetSelector:(SEL)targetSelector
                        currentSelector:(SEL)currentSelector;

/// hook 类方法
/// @param targetCls 需要被 hook 的类
/// @param currentCls 自己的实现方法所在的类
/// @param targetSelector 目标方法
/// @param currentSelector 准备替换目标方法
+ (void)zg_hookClassMethodWithTargetCls:(Class)targetCls
                          currentCls:(Class)currentCls
                      targetSelector:(SEL)targetSelector
                     currentSelector:(SEL)currentSelector;

/// hook 方法
/// @param targetCls 需要被 hook 的类
/// @param currentCls 自己的实现方法所在的类
/// @param targetSelector 目标方法
/// @param currentSelector 准备替换目标方法
/// @param isClassMethod 是否是类方法
+ (void)zg_hookMethodWithTargetCls:(Class)targetCls
                     currentCls:(Class)currentCls
                 targetSelector:(SEL)targetSelector
                currentSelector:(SEL)currentSelector
                  isClassMethod:(BOOL)isClassMethod;

@end
