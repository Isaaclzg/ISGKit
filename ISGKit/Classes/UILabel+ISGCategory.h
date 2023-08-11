//
//  UILabel+ISGCategory.h
//  ISGKit
//
//  Created by Mac on 2023/8/11.
//

@interface UILabel (ISGCategory)

/// 初始化label
/// - Parameters:
///   - color: 文字颜色
///   - fontSize: 系统字体大小
- (instancetype)initWithZG_TextColor:(UIColor *)color
                            fontSize:(CGFloat)fontSize;

/// 初始化label
/// - Parameters:
///   - color: 文字颜色
///   - fontSize: 系统字体大小
///   - text: 文字内容
- (instancetype)initWithZG_TextColor:(UIColor *)color
                         fontSize:(CGFloat)fontSize
                                text:(NSString *)text;

/// 初始化label
/// - Parameters:
///   - color: 文字颜色
///   - font: 字体
- (instancetype)initWithZG_TextColor:(UIColor *)color
                                font:(UIFont *)font;

/// 初始化label
/// - Parameters:
///   - color: 文字颜色
///   - font: 字体
///   - text: 文字内容
- (instancetype)initWithZG_TextColor:(UIColor *)color
                             font:(UIFont *)font
                                text:(NSString *)text;

/// 设置富文本
/// - Parameters:
///   - text: 文字内容
///   - rangeText: 要修改的内容
///   - font: 字体
///   - color: 颜色
- (void)zg_setupAttributeString:(NSString *)text
                   rangeText:(NSString *)rangeText
                        font:(UIFont *)font
                       color:(UIColor *)color;

/// 设置富文本
/// - Parameters:
///   - text: 文字内容
///   - rangeText: 要修改的内容
///   - font: 字体
///   - color: 颜色
///   - rangeText2: 要修改的内容2
///   - font2: 字体2
///   - color2: 颜色2
- (void)zg_setupAttributeString:(NSString *)text
                   rangeText:(NSString *)rangeText
                        font:(UIFont *)font
                       color:(UIColor *)color
                   rangeText2:(NSString *)rangeText2
                        font2:(UIFont *)font2
                      color2:(UIColor *)color2;

@end
