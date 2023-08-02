//
//  UINavigationController+ISGCategory.h
//  ISGKit
//
//  Created by apple on 2023/8/2.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (ISGCategory)

/// pop指定页面
/// - Parameters:
///   - className: 控制器名称
///   - animated: 是否显示动画
- (void)zg_popToViewControllerWithClassName:(NSString *)className
                                   animated:(BOOL)animated;

/// pop返回指定层数
/// - Parameters:
///   - count: 层数
///   - animated: 是否显示动画
- (void)zg_popViewControllerWithCount:(NSInteger)count
                             animated:(BOOL)animated;

@end
