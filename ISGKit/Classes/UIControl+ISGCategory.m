//
//  UIControl+ISGCategory.m
//  ISGKit
//
//  Created by apple on 2023/8/2.
//

#import "UIControl+ISGCategory.h"
#import <objc/runtime.h>

@implementation UIControl (ISGCategory)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL selA =@selector(sendAction:to:forEvent:);
        SEL selB =@selector(zg_sendAction:to:forEvent:);
        
        Method methodA = class_getInstanceMethod(self, selA);
        Method methodB = class_getInstanceMethod(self, selB);
        
        //将methodB的实现添加到系统方法中也就是说将methodA方法指针添加成方法methodB的返回值表示是否添加成功
        BOOL isAdd = class_addMethod(self, selA,method_getImplementation(methodB), method_getTypeEncoding(methodB));
        
        //添加成功了说明本类中不存在methodB所以此时必须将方法b的实现指针换成方法A的，否则b方法将没有实现。
        if (isAdd) {
            class_replaceMethod(self, selB, method_getImplementation(methodA), method_getTypeEncoding(methodA));
        }else {
            //添加失败了说明本类中有methodB的实现，此时只需要将methodA和methodB的IMP互换一下即可。
            method_exchangeImplementations(methodA, methodB);
        }
    });
}

- (void)zg_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([NSStringFromClass(self.class) isEqualToString:@"UIButton"]) {
        self.zg_ignoreEventInterval = self.zg_ignoreEventInterval == 0 ? 0.5 : self.zg_ignoreEventInterval;
        if (self.zg_ignoreEvent) {
            return;
        }else if (self.zg_ignoreEventInterval > 0) {
            [self performSelector:@selector(zg_resetState)withObject:nil afterDelay:self.zg_ignoreEventInterval];
        }
    }
    //此处methodA和methodB方法IMP互换了，实际上执行sendAction；所以不会死循环
    self.zg_ignoreEvent = YES;
    [self zg_sendAction:action to:target forEvent:event];
}

- (void)zg_resetState{
    [self setZg_ignoreEvent:NO];
}

- (void)setZg_ignoreEvent:(BOOL)zg_ignoreEvent {
    objc_setAssociatedObject(self, @selector(zg_ignoreEvent), @(zg_ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)zg_ignoreEvent {
    return [objc_getAssociatedObject(self, @selector(zg_ignoreEvent)) boolValue];
}

- (void)setZg_ignoreEventInterval:(NSTimeInterval)zg_ignoreEventInterval {
    objc_setAssociatedObject(self, @selector(zg_ignoreEventInterval), @(zg_ignoreEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)zg_ignoreEventInterval {
    NSNumber *interval = objc_getAssociatedObject(self, @selector(zg_ignoreEventInterval));
    return interval ? interval.doubleValue : 0.5;
}

@end
