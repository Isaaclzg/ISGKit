//
//  ISGTools.m
//  ZJServer
//
//  Created by isaac on 16/5/27.
//  Copyright © 2016年 ultrapower. All rights reserved.
//

#import "ISGTools.h"
#import "ISGCommon.h"

#define ISG_SCREEN_WIDTH [UIScreen  mainScreen].bounds.size.width

@implementation ISGTools

+ (UIImage*)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (BOOL)isEmptyString:(NSString *)thestring {
    
    if ( !thestring || thestring == nil || thestring == Nil) {
        return YES;
    }
    
    if (thestring == nil)
    {
        return YES;
    }
    if (thestring == NULL)
    {
        return YES;
    }
    if ([thestring isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    if ([thestring isEqual:[NSNull null]]) {
        return YES;
    }
    if ([thestring isEqualToString:@"<null>"]) {
        return YES;
    }
    if ([thestring isEqualToString:@"(null)"]) {
        return YES;
    }
    if ([[thestring stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0)
    {
        return YES;
    }
    return NO;
}

+ (CGFloat)stringWidth:(NSString *)string
            stringSize:(CGFloat)size {

    if ([ISGTools isEmptyString:string]) {
        return 0;
    }
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          [UIFont systemFontOfSize:size], NSFontAttributeName,
                          [UIColor darkTextColor], NSForegroundColorAttributeName,nil];
    
    NSStringDrawingContext *dcontext = [[NSStringDrawingContext alloc] init];
    CGRect contentRect = [string boundingRectWithSize:CGSizeMake(ISG_SCREEN_WIDTH, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:dcontext];
    
    return contentRect.size.width;
}

+ (CGFloat)stringHeight:(NSString *)string
             stringSize:(CGFloat)size {
    
    if ([ISGTools isEmptyString:string]) {
        return 0;
    }
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          [UIFont systemFontOfSize:size], NSFontAttributeName,
                          [UIColor darkTextColor], NSForegroundColorAttributeName,nil];
    
    NSStringDrawingContext *dcontext = [[NSStringDrawingContext alloc] init];
    CGRect contentRect = [string boundingRectWithSize:CGSizeMake(ISG_SCREEN_WIDTH, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:dcontext];
    
    return contentRect.size.height;
}

+ (CGRect)stringSize:(NSString *)str
               size:(CGFloat)size
           MAXWidth:(CGFloat)width {
    
    if ([ISGTools isEmptyString:str]) {
        return CGRectZero;
    }
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          [UIFont systemFontOfSize:size], NSFontAttributeName,
                          [UIColor darkTextColor], NSForegroundColorAttributeName,nil];
    
    NSStringDrawingContext *dcontext = [[NSStringDrawingContext alloc] init];
    CGRect contentRect = [str boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:dcontext];
    
    return contentRect;
}

+ (CGFloat)lableWidthWithFont:(UILabel *)label {

    if ([ISGTools isEmptyString:label.text]) {
        return 0;
    }
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          label.font, NSFontAttributeName,
                          [UIColor darkTextColor], NSForegroundColorAttributeName,nil];
    
    NSStringDrawingContext *dcontext = [[NSStringDrawingContext alloc] init];
    CGRect contentRect = [label.text boundingRectWithSize:CGSizeMake(ISG_SCREEN_WIDTH, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:dcontext];
    
    return contentRect.size.width;
}

+ (CGFloat)lableHeightWithFont:(UILabel *)label {
    
    if ([ISGTools isEmptyString:label.text]) {
        return 0;
    }
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          label.font, NSFontAttributeName,
                          [UIColor darkTextColor], NSForegroundColorAttributeName,nil];
    
    NSStringDrawingContext *dcontext = [[NSStringDrawingContext alloc] init];
    CGRect contentRect = [label.text boundingRectWithSize:CGSizeMake(ISG_SCREEN_WIDTH, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:dcontext];
    
    return contentRect.size.height;
}

+ (CGFloat)stringWidth:(NSString *)string
            StrFont:(UIFont *)font {
    
    if ([ISGTools isEmptyString:string]) {
        return 0;
    }
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          font, NSFontAttributeName,
                          [UIColor darkTextColor], NSForegroundColorAttributeName,nil];
    
    NSStringDrawingContext *dcontext = [[NSStringDrawingContext alloc] init];
    CGRect contentRect = [string boundingRectWithSize:CGSizeMake(ISG_SCREEN_WIDTH, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:dcontext];
    
    return contentRect.size.width;
}

+ (CGFloat)stringHeight:(NSString *)string
             StrFont:(UIFont *)font {
    
    if ([ISGTools isEmptyString:string]) {
        return 0;
    }
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          font, NSFontAttributeName,
                          [UIColor darkTextColor], NSForegroundColorAttributeName,nil];
    
    NSStringDrawingContext *dcontext = [[NSStringDrawingContext alloc] init];
    CGRect contentRect = [string boundingRectWithSize:CGSizeMake(ISG_SCREEN_WIDTH, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:dcontext];
    
    return contentRect.size.height;
}

#pragma mark - 判断是否是手机号码是否合法
+ (BOOL)checkTel:(NSString *)str {

    NSString *regex = @"^(1[0-9])\\d{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}

#pragma mark - 判断身份证是否合法
+ (BOOL)judgeIdentityStringValid:(NSString *)identityString {
    
    if (identityString.length != 18) return NO;
    // 正则表达式判断基本 身份证号是否满足格式
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityStringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(![identityStringPredicate evaluateWithObject:identityString]) return NO;
    
    //** 开始进行校验 *//
    
    //将前17位加权因子保存在数组里
    NSArray *idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
    
    //这是除以11后，可能产生的11位余数、验证码，也保存成数组
    NSArray *idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
    
    //用来保存前17位各自乖以加权因子后的总和
    NSInteger idCardWiSum = 0;
    for(int i = 0;i < 17;i++) {
        NSInteger subStrIndex = [[identityString substringWithRange:NSMakeRange(i, 1)] integerValue];
        NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
        idCardWiSum+= subStrIndex * idCardWiIndex;
    }
    
    //计算出校验码所在数组的位置
    NSInteger idCardMod=idCardWiSum%11;
    //得到最后一位身份证号码
    NSString *idCardLast= [identityString substringWithRange:NSMakeRange(17, 1)];
    //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
    if(idCardMod==2) {
        if(![idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"]) {
            return NO;
        }
    }
    else{
        //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
        if(![idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]]) {
            return NO;
        }
    }
    return YES;
}

#pragma mark - Luhn算法（判断银行卡号是否合法）
+ (BOOL)checkBankCardNumber:(NSString *)cardNumber {
    
    if ([self isEmptyString:cardNumber]) {
        return NO;
    }
    
    int oddSum = 0;     // 奇数和
    int evenSum = 0;    // 偶数和
    int allSum = 0;     // 总和
    
    // 循环加和
    for (NSInteger i = 1; i <= cardNumber.length; i++)
    {
        NSString *theNumber = [cardNumber substringWithRange:NSMakeRange(cardNumber.length-i, 1)];
        int lastNumber = [theNumber intValue];
        if (i%2 == 0)
        {
            // 偶数位
            lastNumber *= 2;
            if (lastNumber > 9)
            {
                lastNumber -=9;
            }
            evenSum += lastNumber;
        }
        else
        {
            // 奇数位
            oddSum += lastNumber;
        }
    }
    allSum = oddSum + evenSum;
    // 是否合法
    if (allSum%10 == 0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark - 判断字符串是否为纯数字
+ (BOOL)isPureNumandCharacters:(NSString *)string {
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
        return NO;
    }
    return YES;
}

+ (NSString *)dataStringFromTimestamp:(NSString *)timeStamp {

    NSTimeInterval _interval=[[timeStamp substringToIndex:10] doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    // 格式
    [objDateformat setDateFormat:@"yyyy-MM-dd HH:mm"];
    return [objDateformat stringFromDate: date];
}

#pragma mark - —————————————————————Version 1.2 Add—————————————————————
#pragma mark - 自动设置label的frame,默认最大宽度为屏幕宽
+ (CGRect )setLabelFrameWithLabel:(UILabel*)label
                           labelX:(CGFloat)x
                           labelY:(CGFloat)y {
   return [self setLabelFrameWithLabel:label labelX:x labelY:y maxWidth:ISG_SCREEN_WIDTH];
}

#pragma mark - 自动设置label的frame
+ (CGRect )setLabelFrameWithLabel:(UILabel*)label
                           labelX:(CGFloat)x
                           labelY:(CGFloat)y
                         maxWidth:(CGFloat)maxWidth
{
    NSDictionary *attrs = @{NSFontAttributeName : label.font};
    CGSize maxSize = CGSizeMake(maxWidth, MAXFLOAT);
    
    // 计算文字占据的高度
    CGSize size = [label.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
    
    return CGRectMake(x, y, size.width, size.height);
 }
@end
