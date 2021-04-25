//
//  ISGTools.m
//  ISGKit
//
//  Created by isaac on 16/5/27.
//  Copyright © 2016年 isaaclzg. All rights reserved.
//

#import "ISGTools.h"

@implementation ISGTools

#pragma mark - —————————————————————Version 3.0.0—————————————————————
#pragma mark - 判断字符串是否为空
+ (BOOL)isEmptyString:(NSString *)string {
    if (!string || string == nil || string == Nil) {
        return YES;
    }
    if (string == nil) {
        return YES;
    }
    if (string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([string isEqual:[NSNull null]]) {
        return YES;
    }
    if ([string isEqualToString:@"<null>"]) {
        return YES;
    }
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
}

#pragma mark - 通过UIColor创建UIImage
+ (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

#pragma mark - 按钮的圆角设置
+ (void)setupRoundedCornersWithView:(UIView *)view cutCorners:(UIRectCorner)rectCorner borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth viewColor:(UIColor *)viewColor cornerRadii:(CGSize)cornerRadii {

    CAShapeLayer *mask = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:rectCorner cornerRadii:cornerRadii];
    mask.path = path.CGPath;
    mask.frame = view.bounds;

    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.path = path.CGPath;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = borderColor.CGColor;
    borderLayer.lineWidth = borderWidth;
    borderLayer.frame = view.bounds;
    view.layer.mask = mask;
    [view.layer addSublayer:borderLayer];
}

#pragma mark - 字符串数组转字符串
+ (NSString *)arrToString:(NSArray *)array replace:(NSString *)replace {
    NSMutableString *mstring = [NSMutableString string];
    for (NSInteger i = 0; i < array.count; i++) {
        if (i == 0) {
            [mstring appendString:array[i]];
        }else {
            [mstring appendFormat:@"%@%@",replace,array[i]];
        }
    }
    return [NSString stringWithFormat:@"%@",mstring];
}

#pragma mark - —————————————————————字符串或UILabel计算宽高—————————————————————
+ (CGRect)textCalculate:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)maxWidth {
    if (!font) {
        NSAssert(font, @">>>>>>>>>>>>>>>>>>font不能为空");
    }
    if ([[self class] isEmptyString:text]) {
        return CGRectZero;
    }
    CGRect contentRect = [text boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return contentRect;
}

+ (CGRect)textCalculate:(NSString *)text font:(UIFont *)font {
    return [[self class] textCalculate:text font:font maxWidth:[UIScreen mainScreen].bounds.size.width];
}

+ (CGFloat)textWidth:(NSString *)text font:(UIFont *)font {
    return [[self class] textCalculate:text font:font maxWidth:[UIScreen mainScreen].bounds.size.width].size.width;
}

+ (CGFloat)textHeight:(NSString *)text font:(UIFont *)font {
    return [[self class] textCalculate:text font:font maxWidth:[UIScreen mainScreen].bounds.size.width].size.height;
}

+ (CGFloat)labelWidth:(UILabel *)label {
    return [[self class] textCalculate:label.text font:label.font maxWidth:[UIScreen mainScreen].bounds.size.width].size.width;
}

+ (CGFloat)labelHeight:(UILabel *)label {
    return [[self class] textCalculate:label.text font:label.font maxWidth:[UIScreen mainScreen].bounds.size.width].size.height;
}
@end
