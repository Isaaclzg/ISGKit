//
//  UINavigationController+ISGCategory.m
//  ISGKit
//
//  Created by apple on 2023/8/2.
//

#import "UINavigationController+ISGCategory.h"

@implementation UINavigationController (ISGCategory)

#pragma mark - pop指定页面
- (void)zg_popToViewControllerWithClassName:(NSString *)className
                                   animated:(BOOL)animated {
    for (UIViewController *vc in self.childViewControllers) {
        if ([vc isKindOfClass:NSClassFromString(className)]) {
            [self popToViewController:vc animated:animated];
            return;
        }
    }
    [self popToRootViewControllerAnimated:animated];
}

#pragma mark - pop返回指定层数
- (void)zg_popViewControllerWithCount:(NSInteger)count
                             animated:(BOOL)animated {
    count = MAX(count, 1);
    NSInteger totalCount  = self.childViewControllers.count;
    NSInteger index = MAX(totalCount - count - 1, 0);
    UIViewController *vc = self.childViewControllers[index];
    [self popToViewController:vc animated:animated];
}


@end
