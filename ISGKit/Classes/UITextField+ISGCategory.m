//
//  UITextField+ISGCategory.m
//  ISGKit
//
//  Created by apple on 2023/8/2.
//

#import "UITextField+ISGCategory.h"
#import <objc/runtime.h>
#import "ISGTools.h"
#import "NSObject+ISGCategory.h"

static NSString *ZGLimitTextLengthKey = @"ZGLimitTextLengthKey";

@interface UITextField()

@property (nonatomic, assign, class) BOOL zg_globalUsingSystemKeyboard;

@end

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

+ (void)load {
    [self zg_hookInstanceMethodWithTargetCls:[self class]
                               currentCls:[self class]
                           targetSelector:NSSelectorFromString(@"dealloc")
                          currentSelector:@selector(zg_textField_deallocSwizzle)];

    [self zg_hookInstanceMethodWithTargetCls:[self class]
                               currentCls:[self class]
                           targetSelector:@selector(initWithFrame:)
                          currentSelector:@selector(zg_textField_initWithFrame:)];
}

- (void)zg_textField_deallocSwizzle {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self zg_textField_deallocSwizzle];
}

- (instancetype)zg_textField_initWithFrame:(CGRect)frame {
    
    self.zg_textMaxLength = 0;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldTextDidChange)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldDidBeginEdit:)
                                                 name:UITextFieldTextDidBeginEditingNotification
                                               object:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldDidEndEdit:)
                                                 name:UITextFieldTextDidEndEditingNotification
                                               object:self];
    
    return [self zg_textField_initWithFrame:frame];
}

- (void)setZg_textMaxLength:(NSInteger)zg_textMaxLength {
    
    NSNumber *number = [NSNumber numberWithInteger:zg_textMaxLength];
    objc_setAssociatedObject(self, @selector(zg_textMaxLength), number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.zg_textMaxLength > 0) {
        [self performDelegate];
    }
}

- (NSInteger)zg_textMaxLength {
    
    return [objc_getAssociatedObject(self, @selector(zg_textMaxLength)) integerValue];
}

- (void)setZg_delegate:(id<ZGTextFieldTextMaxLengthDelegate>)zg_delegate {
    
    objc_setAssociatedObject(self, @selector(zg_delegate), zg_delegate, OBJC_ASSOCIATION_ASSIGN);
    if (self.zg_textMaxLength > 0) {
        [self performDelegate];
    }
}

- (id<ZGTextFieldTextMaxLengthDelegate>)zg_delegate {
    
    return objc_getAssociatedObject(self, @selector(zg_delegate));
}

- (void)setZg_usingSystemKeyboard:(BOOL)zg_usingSystemKeyboard {
    
    objc_setAssociatedObject(self, @selector(zg_usingSystemKeyboard), @(zg_usingSystemKeyboard), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)zg_usingSystemKeyboard {
    
    NSNumber *zg_usingSystemKeyboard = objc_getAssociatedObject(self, @selector(zg_usingSystemKeyboard));
    return [zg_usingSystemKeyboard boolValue];
}

+ (void)setZg_globalUsingSystemKeyboard:(BOOL)zg_globalUsingSystemKeyboard {
    
    objc_setAssociatedObject(self, @selector(zg_globalUsingSystemKeyboard), @(zg_globalUsingSystemKeyboard), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (BOOL)zg_globalUsingSystemKeyboard {
    
    NSNumber *zg_globalUsingSystemKeyboard = objc_getAssociatedObject(self, @selector(zg_globalUsingSystemKeyboard));
    return [zg_globalUsingSystemKeyboard boolValue];
}

- (void)textFieldTextDidChange {
    
    if (self.zg_textMaxLength <= 0) return;
    
    NSString *toBeString = self.text;
    
    UITextRange *selectedRange = [self markedTextRange];
    if (selectedRange && !selectedRange.isEmpty) {
        return;
    }
    if (toBeString.length > self.zg_textMaxLength) {
        self.text = [toBeString substringToIndex:self.zg_textMaxLength];
    }
    [self performDelegate];
}

- (void)textFieldDidBeginEdit:(NSNotification *)notification {
    
    UITextField.zg_globalUsingSystemKeyboard = self.zg_usingSystemKeyboard;
}

- (void)textFieldDidEndEdit:(NSNotification *)notification {
    
    UITextField.zg_globalUsingSystemKeyboard = NO;
}

- (void)performDelegate {
    
    if ([self.zg_delegate respondsToSelector:@selector(textField:textDidChange:textLength:textMaxLength:)]) {
        [self.zg_delegate textField:self
                       textDidChange:self.text
                          textLength:self.text.length
                      textMaxLength:self.zg_textMaxLength];
    }
}

+ (BOOL)zg_shouldAllowExtensionPointIdentifier:(UIApplicationExtensionPointIdentifier)extensionPointIdentifier {
    
    if ([extensionPointIdentifier isEqualToString:@"com.apple.keyboard-service"]) {
        if (self.zg_globalUsingSystemKeyboard) {
            return NO;
        }
    }
    return YES;
}
@end
