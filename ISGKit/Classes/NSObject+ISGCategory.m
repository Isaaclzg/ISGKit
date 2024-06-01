//
//  NSObject+ISGCategory.m
//  ISGKit
//
//  Created by Mac on 2024/6/1.
//

#import "NSObject+ISGCategory.h"
#import <objc/runtime.h>

@implementation NSObject (ISGCategory)

/// hook 实例方法
/// @param targetCls 需要被 hook 的类
/// @param currentCls 自己的实现方法所在的类
/// @param targetSelector 目标方法
/// @param currentSelector 准备替换目标方法
+ (void)zg_hookInstanceMethodWithTargetCls:(Class)targetCls
                             currentCls:(Class)currentCls
                         targetSelector:(SEL)targetSelector
                        currentSelector:(SEL)currentSelector {
    
    [self zg_hookMethodWithTargetCls:targetCls
                       currentCls:currentCls
                   targetSelector:targetSelector
                  currentSelector:currentSelector
                    isClassMethod:NO];
}

/// hook 类方法
/// @param targetCls 需要被 hook 的类
/// @param currentCls 自己的实现方法所在的类
/// @param targetSelector 目标方法
/// @param currentSelector 准备替换目标方法
+ (void)zg_hookClassMethodWithTargetCls:(Class)targetCls
                          currentCls:(Class)currentCls
                      targetSelector:(SEL)targetSelector
                     currentSelector:(SEL)currentSelector {
    [self zg_hookMethodWithTargetCls:targetCls
                       currentCls:currentCls
                   targetSelector:targetSelector
                  currentSelector:currentSelector
                    isClassMethod:YES];
}

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
                  isClassMethod:(BOOL)isClassMethod {
    
    Method targetMethod, currentMethod;
    if (isClassMethod) {
        // 获取类方法
        targetMethod = class_getClassMethod(targetCls, targetSelector);
        currentMethod = class_getClassMethod(currentCls, currentSelector);
    } else {
        // 获取实例方法
        targetMethod = class_getInstanceMethod(targetCls, targetSelector);
        currentMethod = class_getInstanceMethod(currentCls, currentSelector);
    }
    
    // 如果当前需要 hook 的方法是一个类方法
    // 使用 object_getClass 获取元类对象
    Class addCls = isClassMethod ? object_getClass(targetCls) : targetCls;
    
    // cls 类传入需要被 hook 的类
    // name 传入需要被 hook 的方法，如果 cls 类本身有该方法，返回结果为 NO，如果没有返回结果为 YES 代表添加该方法成功
    // imp 传入当前我们自己的方法具体实现
    // types 传入 imp 参数的方法编码字符串
    // 这一步主要的目的两点：
    // 1. 判断目标类本身是否有目标方法
    // 2. 没有目标方法，给目标类本身添加一个目标方法，并且将自己的方法具体实现赋值给目标方法
    BOOL addMethodSuccess = class_addMethod(addCls,
                                            targetSelector,
                                            method_getImplementation(currentMethod),
                                            method_getTypeEncoding(currentMethod));
    
    if (addMethodSuccess) {
        // 添加成功，目标类本身并没有这个方法，接下来就要将我们自己方法的实现替换成目标方法的实现
        class_replaceMethod(addCls,
                            currentSelector,
                            method_getImplementation(targetMethod),
                            method_getTypeEncoding(targetMethod));
    } else {
        // 目标类本身就有这个方法，直接将方法的实现进行交换
        method_exchangeImplementations(targetMethod, currentMethod);
    }
}


@end
