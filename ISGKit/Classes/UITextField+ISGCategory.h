//
//  UITextField+ISGCategory.h
//  ISGKit
//
//  Created by apple on 2023/8/2.
//

#import <UIKit/UIKit.h>

@protocol ZGTextFieldTextMaxLengthDelegate <NSObject>

@optional

/// UITextField 文本发生改变代理方法
/// @param textField UITextField输入框
/// @param text 当前文本字符串
/// @param textLength 当前文本字符串长度
/// @param textMaxLength 当前输入框限制最大字符长度
- (void)textField:(UITextField *)textField
    textDidChange:(NSString *)text
       textLength:(NSInteger)textLength
    textMaxLength:(NSInteger)textMaxLength;

@end

@interface UITextField (ISGCategory)

/// 代理
@property (nonatomic, weak) id<ZGTextFieldTextMaxLengthDelegate> zg_delegate;

/// 文本最大字数限制
@property (nonatomic, assign) NSInteger zg_textMaxLength;

/// 使用系统键盘
@property (nonatomic, assign) BOOL zg_usingSystemKeyboard;

/// 键盘控制在 AppDelegate 中的 application:shouldAllowExtensionPointIdentifier: 调用
+ (BOOL)zg_shouldAllowExtensionPointIdentifier:(UIApplicationExtensionPointIdentifier)extensionPointIdentifier;

/// 限制输入字数
/// - Parameter length: 限制输入字数
- (void)zg_limitTextLength:(NSInteger)length;

/// 添加左内边距
/// - Parameter leftPadding: 距离
- (void)zg_setLeftPadding:(CGFloat)leftPadding;

/// 添加右内边距
/// - Parameter rightPadding: 距离
- (void)zg_setRightPadding:(CGFloat)rightPadding;

/// 添加左右内边距
/// - Parameters:
///   - leftPadding: 左边距
///   - rightPadding: 右边距
- (void)zg_setLeftPadding:(CGFloat)leftPadding
             rightPadding:(CGFloat)rightPadding;

/// 自定义placeholder
/// - Parameters:
///   - placeholder: placeholdern内容
///   - placeholderColor: placeholder颜色
- (void)zg_setAttributedPlaceholder:(NSString *)placeholder
                   placeholderColor:(UIColor *)placeholderColor;
@end
