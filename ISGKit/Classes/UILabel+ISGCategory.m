//
//  UILabel+ISGCategory.m
//  ISGKit
//
//  Created by Mac on 2023/8/11.
//

#import "UILabel+ISGCategory.h"

@implementation UILabel (ISGCategory)

- (instancetype)initWithZG_TextColor:(UIColor *)color
                         fontSize:(CGFloat)fontSize {
    self = [super init];
    if (self) {
        self.textColor = color;
        self.font = [UIFont systemFontOfSize:fontSize];
        self.numberOfLines = 0;
    }
    return self;
}

- (instancetype)initWithZG_TextColor:(UIColor *)color
                         fontSize:(CGFloat)fontSize
                             text:(NSString *)text {
    self = [super init];
    if (self) {
        self.text = text;
        self.textColor = color;
        self.font = [UIFont systemFontOfSize:fontSize];
        self.numberOfLines = 0;
    }
    return self;
}

- (instancetype)initWithZG_TextColor:(UIColor *)color
                             font:(UIFont *)font {
    self = [super init];
    if (self) {
        self.textColor = color;
        self.font = font;
        self.numberOfLines = 0;
    }
    return self;
}

- (instancetype)initWithZG_TextColor:(UIColor *)color
                             font:(UIFont *)font
                             text:(NSString *)text {
    self = [super init];
    if (self) {
        self.text = text;
        self.textColor = color;
        self.font = font;
        self.numberOfLines = 0;
    }
    return self;
}

- (void)zg_setupAttributeString:(NSString *)text
                   rangeText:(NSString *)rangeText
                        font:(UIFont *)font
                       color:(UIColor *)color {
    
    NSRange hightlightTextRange = [text rangeOfString:rangeText];
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:text];
    if (hightlightTextRange.length > 0) {
        if (font) {
            [attributeStr addAttribute:NSFontAttributeName value:font range:hightlightTextRange];
        }
        if (color) {
            [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:hightlightTextRange];
        }
        self.attributedText = attributeStr;
    }else {
        self.text = text;
    }
}

- (void)zg_setupAttributeString:(NSString *)text
                   rangeText:(NSString *)rangeText
                        font:(UIFont *)font
                       color:(UIColor *)color
                   rangeText2:(NSString *)rangeText2
                        font2:(UIFont *)font2
                      color2:(UIColor *)color2 {
    NSRange hightlightTextRange = [text rangeOfString:rangeText];
    NSRange hightlightTextRange2 = [text rangeOfString:rangeText2];
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:text];
    if (hightlightTextRange.length > 0) {
        if (font) {
            [attributeStr addAttribute:NSFontAttributeName value:font range:hightlightTextRange];
        }
        if (color) {
            [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:hightlightTextRange];
        }
    }
    if (hightlightTextRange2.length > 0) {
        if (font2) {
            [attributeStr addAttribute:NSFontAttributeName value:font2 range:hightlightTextRange2];
        }
        if (color2) {
            [attributeStr addAttribute:NSForegroundColorAttributeName value:color2 range:hightlightTextRange2];
        }
    }
    if (hightlightTextRange.length > 0 || hightlightTextRange2.length > 0) {
        self.attributedText = attributeStr;
    }else {
        self.text = text;
    }
}


@end
