//
//  ISGTools.h
//  ZJServer
//
//  Created by isaac on 16/5/27.
//  Copyright © 2016年 ultrapower. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ISGTools : NSObject

/**
 *  通过UIColor创建UIImage
 *
 *  @param color 颜色
 *
 *  @return UIImage
 */
+ (UIImage*)createImageWithColor:(UIColor *)color;

/**
 *  判断字符串是否为空
 *
 *  @param thestring 字符串
 *
 *  @return 是否为空
 */
+ (BOOL)isEmptyString:(NSString *)thestring;

/**
 *  获取字符串的宽度
 *
 *  @param string 字符串
 *  @param size   字体大小
 *
 *  @return 宽度
 */
+ (CGFloat)stringWidth:(NSString *)string
            stringSize:(CGFloat)size;

/**
 *  获取字符串的高度
 *
 *  @param string 字符串
 *  @param size   字体大小
 *
 *  @return 高度
 */
+ (CGFloat)stringHeight:(NSString *)string
             stringSize:(CGFloat)size;

/**
 *  限制宽度 得到字符串的宽高
 *
 *  @param str   字符串
 *  @param size  字体大小
 *  @param width 最大宽度
 *
 *  @return CGRect（宽和高）
 */
+ (CGRect)stringSize:(NSString *)str
                size:(CGFloat)size
            MAXWidth:(CGFloat)width;

/**
 *  根据UILabel内容获取Label的宽度
 *
 *  @param label Label
 *
 *  @return 宽度
 */
+ (CGFloat)lableWidthWithFont:(UILabel *)label;

/**
 *  根据UILabel内容获取Label的高度
 *
 *  @param label Label
 *
 *  @return 高度
 */
+ (CGFloat)lableHeightWithFont:(UILabel *)label;


/**
 根据字符串的内容和字体获取字符串宽度

 @param string 字符串内容
 @param font 字体
 @return 宽度
 */
+ (CGFloat)stringWidth:(NSString *)string
               StrFont:(UIFont *)font;


/**
 根据字符串的内容和字体获取字符串高度

 @param string 字符串内容
 @param font 字体
 @return 高度
 */
+ (CGFloat)stringHeight:(NSString *)string
                StrFont:(UIFont *)font;

/**
 十三位的时间戳转出时间

 @param timeStamp 13位时间戳
 @return 时间
 */
+ (NSString *)dataStringFromTimestamp:(NSString *)timeStamp;


/**
 自动设置label的frame（默认的最大宽度为屏幕宽）

 @param label label
 @param x x
 @param y y
 @return frame
 */
+ (CGRect )setLabelFrameWithLabel:(UILabel*)label
                           labelX:(CGFloat)x
                           labelY:(CGFloat)y;

/**
  自动设置label的frame

 @param label label
 @param x x
 @param y y
 @param maxWidth 最大宽度
 @return frame
 */
+ (CGRect )setLabelFrameWithLabel:(UILabel*)label
                           labelX:(CGFloat)x
                           labelY:(CGFloat)y
                         maxWidth:(CGFloat)maxWidth;

/**
 自动设置居右的label的frame（仅适用父视图的宽度以及最大宽度都是屏幕宽的时候）

 @param label label
 @param x 居右的距离
 @param y y
 @return frame
 */
+ (CGRect )setRightLabelFrameWithLabel:(UILabel*)label
                                rightX:(CGFloat)x
                                labelY:(CGFloat)y;

/**
 自动设置居右的label的frame

 @param label label
 @param x 居右的距离
 @param y y
 @param parentWidth 父视图的宽度
 @return frame
 */
+ (CGRect )setRightLabelFrameWithLabel:(UILabel*)label
                                rightX:(CGFloat)x
                                labelY:(CGFloat)y
                           parentWidth:(CGFloat)parentWidth;

/**
 自动设置距离父视图右侧label的frame

 @param label label
 @param x 居右的距离
 @param y y
 @param parentWidth 父视图的宽度
 @param maxWidth 最大宽度
 @return frame
 */
+ (CGRect )setRightLabelFrameWithLabel:(UILabel*)label
                                rightX:(CGFloat)x
                                labelY:(CGFloat)y
                           parentWidth:(CGFloat)parentWidth
                              maxWidth:(CGFloat)maxWidth;

/**
 NSDictionary转JSON

 @param object NSDictionary
 @return JSON
 */
+ (NSString*)dataToJsonString:(id)object;
@end
