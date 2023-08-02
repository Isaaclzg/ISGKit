//
//  UIButton+ISGCategory.h
//  ISGKit
//
//  Created by apple on 2023/8/2.
//

#import <UIKit/UIKit.h>

@interface UIButton (ISGCategory)

/// 快速创建自定义按钮
+ (instancetype)zg_customButton;

/// 创建自定义按钮
/// - Parameters:
///   - title: 标题
///   - titleColor: 标题颜色
///   - font: 标题字体
+ (instancetype)zg_customButtonTitle:(NSString *)title
                               titleColor:(UIColor *)titleColor
                                font:(UIFont *)font;

@end
