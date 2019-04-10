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

#pragma mark - —————————————————————Version 1.3 Add—————————————————————
#pragma mark - 自动设置距离父视图右侧label的frame,默认label的最大宽度为屏幕宽,其父视图宽度为屏幕宽时，适用
+ (CGRect )setRightLabelFrameWithLabel:(UILabel*)label
                                rightX:(CGFloat)x
                                labelY:(CGFloat)y
{
    return [self setRightLabelFrameWithLabel:label rightX:x labelY:y parentWidth:kScreenWidth maxWidth:kScreenWidth];
}

#pragma mark - 自动设置距离父视图右侧label的frame,默认label的最大宽度为屏幕宽
+ (CGRect )setRightLabelFrameWithLabel:(UILabel*)label
                                rightX:(CGFloat)x
                                labelY:(CGFloat)y
                           parentWidth:(CGFloat)parentWidth
{
    return [self setRightLabelFrameWithLabel:label rightX:x labelY:y parentWidth:parentWidth maxWidth:kScreenWidth];
}

#pragma mark - 自动设置距离父视图右侧label的frame
+ (CGRect )setRightLabelFrameWithLabel:(UILabel*)label
                           rightX:(CGFloat)x
                           labelY:(CGFloat)y
                           parentWidth:(CGFloat)parentWidth
                              maxWidth:(CGFloat)maxWidth {
    
    NSDictionary *attrs = @{NSFontAttributeName : label.font};
    CGSize maxSize = CGSizeMake(maxWidth, MAXFLOAT);
    
    // 计算文字占据的高度
    CGSize size = [label.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
    return CGRectMake(parentWidth - x - size.width, y, size.width, size.height);
   
}

#pragma mark - —————————————————————Version 1.4 Add—————————————————————
#pragma mark - NSDictionary转JSON
+ (NSString*)dataToJsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (!jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

#pragma mark - —————————————————————Version 1.5 Add—————————————————————
// 修改对iPhoneX的判断

#pragma mark - —————————————————————Version 1.6 Add—————————————————————
// 新增ISGFullLog，打印完成json使用
#pragma mark - —————————————————————Version 1.7 Add—————————————————————
#pragma mark - 字符串为空时替换对应的字符串
+ (NSString *)replaceEmptyString:(NSString *)string EmptyString:(NSString *)emptyString {
    if ([[self class] isEmptyString:string]) {
        return emptyString;
    }
    return string;
}
@end
