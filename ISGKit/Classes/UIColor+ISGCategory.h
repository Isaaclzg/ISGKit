//
//  UIColor+ISGCategory.h
//  ISGKit
//
//  Created by admin on 2019/4/11.
//

#import <UIKit/UIKit.h>

@interface UIColor (ISGCategory)

/**
 RGBA 设置颜色
 
 @param red 红色
 @param green 绿色
 @param blue 蓝色
 @param alpha 透明度0-1
 @return UIColor
 */
+ (UIColor *)colorWithFFRed:(CGFloat)red
                      green:(CGFloat)green
                       blue:(CGFloat)blue
                      alpha:(CGFloat)alpha;

/**
 RGB设置颜色，默认透明度1
 
 @param red 红色
 @param green 绿色
 @param blue 蓝色
 @return UIColor
 */
+ (UIColor *)colorWithFFRed:(CGFloat)red
                      green:(CGFloat)green
                       blue:(CGFloat)blue;

/**
 *  随机颜色
 *
 *  @return UIColor
 */
+ (UIColor *)randomColor;

/**
 *  根据十六进制转换为颜色
 *
 *  @param hex UInt32
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHex:(UInt32)hex;

/**
 *  获取对应的颜色
 *
 *  @param hex   UInt32
 *  @param alpha CGFloat（0---1）
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHex:(UInt32)hex
                 andAlpha:(CGFloat)alpha;

/**
 *  根据十六进制字符串转换为颜色
 *
 *  @param hexString NSString
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;


/**
 从十六进制字符串获取颜色，
 
 @param alpha hexString NSString
 @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color
                          alpha:(CGFloat)alpha;

@end
