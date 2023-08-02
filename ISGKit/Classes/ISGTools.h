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

/// 获取应用版本号
+ (NSString *)getAppVersion;

/// 获取应用build号
+ (NSString *)getAppBuild;

/// NSDate转字符串
/// - Parameters:
///   - date: 时间
///   - dateFormat: 时间格式化
+ (NSString *)dateToString:(NSDate *)date
                dateFormat:(NSString *)dateFormat;

/// 得到旋转后的图片
/// - Parameters:
///   - image: 原图
///   - angle: 角度（0~360）
+ (UIImage *)getRotationImageWithImage:(UIImage *)image
                                 angle:(CGFloat)angle;

/// 前台压缩（可能比较慢，造成当前进程卡住） 压缩得到 目标大小的 图片Data
/// - Parameters:
///   - oldImage: 原图
///   - showSize: 将要显示的分辨率
///   - fileSize: 文件大小限制(单位：KB)
+ (NSData *)compressToDataWithImage:(UIImage *)oldImage
                          showSize:(CGSize)showSize
                           fileSize:(NSInteger)fileSize;

/// 压缩得到 目标大小的 UIImage
/// - Parameters:
///   - oldImage: 原图
///   - showSize: 将要显示的分辨率
///   - fileSize: 文件大小限制(单位：KB)
+ (UIImage *)compressToImageWithImage:(UIImage *)oldImage
                            showSize:(CGSize)showSize
                             fileSize:(NSInteger)fileSize;

/// 只压不缩--返回UIImage  优点：不影响分辨率，不太影响清晰度 缺点：存在最小限制，可能压不到目标大小
/// - Parameters:
///   - oldImage: 原图
///   - fileSize: 文件大小限制(单位：KB)
+ (UIImage *)onlyCompressToImageWithImage:(UIImage *)oldImage
                                 fileSize:(NSInteger)fileSize;

/// 只压不缩--按NSData大小压缩，返回NSData 优点：不影响分辨率，不太影响清晰度 缺点：存在最小限制，可能压不到目标大小
/// - Parameters:
///   - oldImage: 原图
///   - fileSize: 文件大小限制(单位：KB)
+ (NSData *)onlyCompressToDataWithImage:(UIImage *)oldImage
                               fileSize:(NSInteger)fileSize;

/// 只缩不压
/// - Parameters:
///   - oldImage: 原图
///   - size: 文件大小限制(单位：KB)
///   - scale: 若Scale为YES，则原图会根据Size进行拉伸-会变形若Scale为NO，则原图会根据Size进行填充-不会变形。
+ (UIImage *)resizeImageWithImage:(UIImage *)oldImage
                          andSize:(CGSize)size
                            scale:(BOOL)scale;

@end
