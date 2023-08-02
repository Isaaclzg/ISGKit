//
//  UIButton+ISGCategory.m
//  ISGKit
//
//  Created by apple on 2023/8/2.
//

#import "UIButton+ISGCategory.h"

@implementation UIButton (ISGCategory)

#pragma mark - 快速创建自定义按钮
+ (instancetype)zg_customButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.adjustsImageWhenDisabled = NO;
    button.adjustsImageWhenHighlighted = NO;
    return button;
}

#pragma mark - 创建按钮
+ (instancetype)zg_customButtonTitle:(NSString *)title
                          titleColor:(UIColor *)titleColor
                                font:(UIFont *)font {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.adjustsImageWhenDisabled = NO;
    button.adjustsImageWhenHighlighted = NO;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    return button;
}

@end
