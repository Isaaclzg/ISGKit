//
//  UITextField+ISGCategory.h
//  ISGKit
//
//  Created by apple on 2023/8/2.
//

#import <UIKit/UIKit.h>

@interface UITextField (ISGCategory)

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
