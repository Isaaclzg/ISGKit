//
//  ISGTools.h
//  ISGKit
//
//  Created by isaac on 16/5/27.
//  Copyright © 2016年 isaaclzg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ISGTools : NSObject

/// 判断字符串是否为空
/// @param string 为空时返回YES
+ (BOOL)isEmptyString:(NSString *)string;

/**
 *  通过UIColor创建UIImage
 *
 *  @param color 颜色
 *
 *  @return UIImage
 */
+ (UIImage*)createImageWithColor:(UIColor *)color;

/// 按钮的圆角设置
/// @param view 需要设置圆角的视图
/// @param rectCorner 圆角位置
/// @param borderColor 边框颜色
/// @param borderWidth 边框宽度
/// @param viewColor 视图颜色
/// @param cornerRadii 圆角度
+ (void)setupRoundedCornersWithView:(UIView *)view cutCorners:(UIRectCorner)rectCorner borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth viewColor:(UIColor *)viewColor cornerRadii:(CGSize)cornerRadii;

/// 字符串数组转字符串
/// @param array 字符串数组
/// @param replace 分割符
+ (NSString *)arrToString:(NSArray *)array replace:(NSString *)replace;

/// 字符串或UILabel计算宽高
/// @param text 字符串或UILabel
/// @param font 字体
/// @param maxWidth 最大宽度
+ (CGRect)textCalculate:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)maxWidth;

/// 字符串或UILabel计算宽高
/// @param text 字符串或UILabel
/// @param font 字体
+ (CGRect)textCalculate:(NSString *)text font:(UIFont *)font;

/// 字符串或UILabel计算宽度
/// @param text 字符串或UILabel
/// @param font 字体
+ (CGFloat)textWidth:(NSString *)text font:(UIFont *)font;

/// 字符串或UILabel计算高度
/// @param text 字符串或UILabel
/// @param font 字体
+ (CGFloat)textHeight:(NSString *)text font:(UIFont *)font;

/// UILabel计算宽度
/// @param label label
+ (CGFloat)labelWidth:(UILabel *)label;

/// UILabel计算高度
/// @param label label
+ (CGFloat)labelHeight:(UILabel *)label;
@end
