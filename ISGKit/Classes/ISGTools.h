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
 判断手机号时候合法

 @param str 手机号
 */
+ (BOOL)checkTel:(NSString *)str;


/**
 判断身份证是否合法

 @param identityString 身份证号
 @return 是否合法
 */
+ (BOOL)judgeIdentityStringValid:(NSString *)identityString;


/**
 判断银行卡号是否合法

 @param cardNumber 银行卡号
 @return 时候合法
 */
+ (BOOL)checkBankCardNumber:(NSString *)cardNumber;


/**
 十三位的时间戳转出时间

 @param timeStamp 13位时间戳
 @return 时间
 */
+ (NSString *)dataStringFromTimestamp:(NSString *)timeStamp;


/**
 判断字符串是否为纯数字

 @param string 字符串
 @return yes是   no不是
 */
+ (BOOL)isPureNumandCharacters:(NSString *)string;
@end
