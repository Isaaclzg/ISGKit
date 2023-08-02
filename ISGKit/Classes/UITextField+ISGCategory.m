//
//  UITextField+ISGCategory.m
//  ISGKit
//
//  Created by apple on 2023/8/2.
//

#import "UITextField+ISGCategory.h"
#import <objc/runtime.h>
#import "ISGTools.h"

static NSString *ZGLimitTextLengthKey = @"ZGLimitTextLengthKey";

@implementation UITextField (ISGCategory)

#pragma mark - 限制输入字数
- (void)zg_limitTextLength:(NSInteger)length {
    objc_setAssociatedObject(self, (__bridge const void *)(ZGLimitTextLengthKey), [NSNumber numberWithInteger:length], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
 
    [self addTarget:self action:@selector(zg_textFieldTextLengthLimit:) forControlEvents:UIControlEventEditingChanged];
}

- (void)zg_textFieldTextLengthLimit:(id)sender {
    NSNumber *lengthNumber = objc_getAssociatedObject(self, (__bridge const void *)(ZGLimitTextLengthKey));
    NSInteger length = [lengthNumber integerValue];
    // 推断当前输入法是否是中文
    BOOL isChinese;
    NSArray *currentar = [UITextInputMode activeInputModes];
    UITextInputMode *current = [currentar firstObject];

    if ([current.primaryLanguage isEqualToString: @"en-US"]) {
        isChinese = false;
    }else {
        isChinese = true;
    }
 
    if (sender == self) {
        // length是自己设置的位数
        NSString *str = [[self text] stringByReplacingOccurrencesOfString:@"?" withString:@""];
        if (isChinese) { // 中文输入法下
            UITextRange *selectedRange = [self markedTextRange];
            //获取高亮部分
            UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (!position) {
                if (str.length >= length) {
                    NSString *strNew = [NSString stringWithString:str];
                    [self setText:[strNew substringToIndex:length]];
                }
            }else {
               // NSLog(@"输入的");
 
            }
        }else {
            if ([str length] >= length) {
                NSString *strNew = [NSString stringWithString:str];
                [self setText:[strNew substringToIndex:length]];
            }
        }
    }
}

#pragma mark - 添加空白内间距
- (void)zg_setLeftPadding:(CGFloat)leftPadding {
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, leftPadding, 0)];
    leftView.backgroundColor = self.backgroundColor;
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)zg_setRightPadding:(CGFloat)rightPadding {
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rightPadding, 0)];
    rightView.backgroundColor = self.backgroundColor;
    self.rightView = rightView;
    self.rightViewMode = UITextFieldViewModeAlways;
}

- (void)zg_setLeftPadding:(CGFloat)leftPadding
             rightPadding:(CGFloat)rightPadding {
    [self zg_setLeftPadding:leftPadding];
    [self zg_setRightPadding:rightPadding];
}

#pragma mark - 自定义placeholder
- (void)zg_setAttributedPlaceholder:(NSString *)placeholder
                   placeholderColor:(UIColor *)placeholderColor {
    if ([ISGTools isEmptyString:placeholder]) {
        return;
    }
    NSRange hightlightTextRange = [placeholder rangeOfString:placeholder];
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:placeholder];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:placeholderColor range:hightlightTextRange];
    self.attributedPlaceholder = attributeStr;
}

@end
