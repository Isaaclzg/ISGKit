//
//  NSString+ISGCategory.h
//  ISGKit
//
//  Created by admin on 2019/4/11.
//

#import <Foundation/Foundation.h>

@interface NSString (ISGCategory)

/*
 *获取汉字拼音的首字母, 返回的字母是大写形式, 例如: @"俺妹", 返回 @"A".
 *如果字符串开头不是汉字, 而是字母, 则直接返回该字母, 例如: @"b彩票", 返回 @"B".
 *如果字符串开头不是汉字和字母, 则直接返回 @"#", 例如: @"&哈哈", 返回 @"#".
 *字符串开头有特殊字符(空格,换行)不影响判定, 例如@"       a啦啦啦", 返回 @"A".
 */
- (NSString *)getFirstLetter;

/**
 检查手机号是否合法
 
 @return 手机号是否合法
 */
- (BOOL)checkTelePhoneNumber;

/**
 检查是否为座机号
 
 @return 座机号是否合法
 */
- (BOOL)checkSpecialPlane;

/**
 检查身份证是否合法
 
 @return 身份证是否合法
 */
- (BOOL)judgeIdentityStringValid;

/**
 判断银行卡号是否合法（Luhn算法）
 
 @return 判断银行卡号是否合法
 */
- (BOOL)checkBankCardNumber;

/**
 判断字符串是否为纯数字
 
 @return 字符串是否为纯数字
 */
- (BOOL)isPureNumandCharacters;

/// 当字符串为空时用replaceString代替
/// @param string 字符串
/// @param replaceString 要代替的字符串
- (NSString *)replaceEmptyString:(NSString *)string replaceString:(NSString *)replaceString;
@end
