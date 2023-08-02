//
//  UIView+ISGCategory.m
//  ISGKit
//
//  Created by admin on 2019/4/11.
//

#import "UIView+ISGCategory.h"
#import <objc/runtime.h>

NSString const *BlockTapKey = @"BlockTapKey";

NSString const *BlockKey = @"BlockKey";

@implementation UIView (ISGCategory)

#pragma mark - —————————————————————Frame—————————————————————
#pragma mark - Getter
- (CGPoint)origin_zg {
    return self.frame.origin;
}

- (CGSize)size_zg {
    return self.frame.size;
}

- (CGFloat)width_zg {
    return self.frame.size.width;
}

- (CGFloat)height_zg {
    return self.frame.size.height;
}

- (CGFloat)top_zg {
    return self.frame.origin.y;
}

- (CGFloat)left_zg {
    return self.frame.origin.x;
}

- (CGFloat)bottom_zg {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)right_zg {
    return self.frame.origin.x + self.frame.size.width;
}

#pragma mark - Setter
- (void)setOrigin_zg:(CGPoint)origin_zg {
    CGRect newframe = self.frame;
    newframe.origin = origin_zg;
    self.frame = newframe;
}

- (void)setSize_zg:(CGSize)size_zg {
    CGRect newframe = self.frame;
    newframe.size = size_zg;
    self.frame = newframe;
}

- (void)setWidth_zg:(CGFloat)width_zg {
    CGRect newframe = self.frame;
    newframe.size.width = width_zg;
    self.frame = newframe;
}

- (void)setHeight_zg:(CGFloat)height_zg {
    CGRect newframe = self.frame;
    newframe.size.height = height_zg;
    self.frame = newframe;
}

- (void)setTop_zg:(CGFloat)top_zg {
    CGRect newframe = self.frame;
    newframe.origin.y = top_zg;
    self.frame = newframe;
}

- (void)setLeft_zg:(CGFloat)left_zg {
    CGRect newframe = self.frame;
    newframe.origin.x = left_zg;
    self.frame = newframe;
}

- (void)setBottom_zg:(CGFloat)bottom_zg {
    CGRect newframe = self.frame;
    newframe.origin.y = bottom_zg - self.frame.size.height;
    self.frame = newframe;
}

- (void)setRight_zg:(CGFloat)right_zg {
    CGFloat delta = right_zg - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta;
    self.frame = newframe;
}
#pragma mark - —————————————————————添加点击事件—————————————————————
- (void)addActionWithblock:(ZGTouchCallBackBlock)block
{
    self.touchCallBackBlock = block;
    
    self.userInteractionEnabled = YES;
    
    /**
     *  添加相同事件方法，，先将原来的事件移除，避免重复调用
     */
    NSMutableArray *taps = [self allUIViewBlockTaps];
    [taps enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UITapGestureRecognizer *tap = (UITapGestureRecognizer *)obj;
        [self removeGestureRecognizer:tap];
    }];
    [taps removeAllObjects];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(invoke:)];
    [self addGestureRecognizer:tap];
    [taps addObject:tap];
}

- (void)invoke:(id)sender
{
    if(self.touchCallBackBlock) {
        self.touchCallBackBlock();
    }
}

- (void)setTouchCallBackBlock:(ZGTouchCallBackBlock)touchCallBackBlock
{
    objc_setAssociatedObject(self, &BlockKey, touchCallBackBlock, OBJC_ASSOCIATION_COPY);
}

- (ZGTouchCallBackBlock)touchCallBackBlock
{
    return objc_getAssociatedObject(self, &BlockKey);
}

- (void)addTarget:(id)target action:(SEL)action
{
    self.userInteractionEnabled = YES;
    
    /**
     *  添加相同事件方法，，先将原来的事件移除，避免重复调用
     */
    NSMutableArray *taps = [self allUIViewBlockTaps];
    [taps enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UITapGestureRecognizer *tap = (UITapGestureRecognizer *)obj;
        [self removeGestureRecognizer:tap];
    }];
    [taps removeAllObjects];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
    [taps addObject:tap];
}

- (NSMutableArray *)allUIViewBlockTaps
{
    NSMutableArray *taps = objc_getAssociatedObject(self, &BlockTapKey);
    if (!taps) {
        taps = [NSMutableArray array];
        objc_setAssociatedObject(self, &BlockTapKey, taps, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return taps;
}

#pragma mark - ————————————————————— 周边加阴影，并且同时圆角—————————————————————
- (void)addShadowWithOpacity:(float)shadowOpacity
           shadowRadius:(CGFloat)shadowRadius
        andCornerRadius:(CGFloat)cornerRadius
{
    //////// shadow /////////
    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.frame = self.layer.frame;
    
    shadowLayer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    shadowLayer.shadowOffset = CGSizeMake(0, 0);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    shadowLayer.shadowOpacity = shadowOpacity;//0.8;//阴影透明度，默认0
    shadowLayer.shadowRadius = shadowRadius;//8;//阴影半径，默认3
    
    //路径阴影
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    float width = shadowLayer.bounds.size.width;
    float height = shadowLayer.bounds.size.height;
    float x = shadowLayer.bounds.origin.x;
    float y = shadowLayer.bounds.origin.y;
    
    CGPoint topLeft      = shadowLayer.bounds.origin;
    CGPoint topRight     = CGPointMake(x + width, y);
    CGPoint bottomRight  = CGPointMake(x + width, y + height);
    CGPoint bottomLeft   = CGPointMake(x, y + height);
    
    CGFloat offset = -1.f;
    [path moveToPoint:CGPointMake(topLeft.x - offset, topLeft.y + cornerRadius)];
    [path addArcWithCenter:CGPointMake(topLeft.x + cornerRadius, topLeft.y + cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI endAngle:M_PI_2 * 3 clockwise:YES];
    [path addLineToPoint:CGPointMake(topRight.x - cornerRadius, topRight.y - offset)];
    [path addArcWithCenter:CGPointMake(topRight.x - cornerRadius, topRight.y + cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI_2 * 3 endAngle:M_PI * 2 clockwise:YES];
    [path addLineToPoint:CGPointMake(bottomRight.x + offset, bottomRight.y - cornerRadius)];
    [path addArcWithCenter:CGPointMake(bottomRight.x - cornerRadius, bottomRight.y - cornerRadius) radius:(cornerRadius + offset) startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path addLineToPoint:CGPointMake(bottomLeft.x + cornerRadius, bottomLeft.y + offset)];
    [path addArcWithCenter:CGPointMake(bottomLeft.x + cornerRadius, bottomLeft.y - cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    [path addLineToPoint:CGPointMake(topLeft.x - offset, topLeft.y + cornerRadius)];
    
    //设置阴影路径
    shadowLayer.shadowPath = path.CGPath;
    
    //////// cornerRadius /////////
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    [self.superview.layer insertSublayer:shadowLayer below:self.layer];
}

#pragma mark - 设置圆角
- (void)zg_setRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

#pragma mark - 设置边框
- (void)zg_setBorder:(UIColor *)borderColor
         borderWidth:(CGFloat)borderWidth {
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
}

#pragma mark - 设置任意圆角及边框(实线/虚线)
- (void)zg_addCorners:(UIRectCorner)corners
             radius:(CGFloat)radius
         lineWidth:(CGFloat)lineWidth
         lineColor:(UIColor *_Nullable )lineColor
              dash:(NSArray<NSNumber *>*_Nullable )lineDashPattern {
    
    ///解决masonry布局获取不了正确的frame
    [self.superview layoutIfNeeded];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius,radius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.lineWidth = lineWidth;
    borderLayer.strokeColor = lineColor.CGColor;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    if (lineDashPattern) {
        borderLayer.lineDashPattern = lineDashPattern;
    }
    borderLayer.path = maskPath.CGPath;
    [self.layer insertSublayer:borderLayer atIndex:0];
    self.layer.mask = maskLayer;
}

#pragma mark - 视图添加抖动
- (void)zg_shake {
    CAKeyframeAnimation *keyAn = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [keyAn setDuration:0.5f];
    NSArray *array = [[NSArray alloc] initWithObjects:
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x - 5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x + 5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x - 5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x + 5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x - 5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x + 5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      nil];
    [keyAn setValues:array];
 
    NSArray *times = [[NSArray alloc] initWithObjects:
                      [NSNumber numberWithFloat:0.1f],
                      [NSNumber numberWithFloat:0.2f],
                      [NSNumber numberWithFloat:0.3f],
                      [NSNumber numberWithFloat:0.4f],
                      [NSNumber numberWithFloat:0.5f],
                      [NSNumber numberWithFloat:0.6f],
                      [NSNumber numberWithFloat:0.7f],
                      [NSNumber numberWithFloat:0.8f],
                      [NSNumber numberWithFloat:0.9f],
                      [NSNumber numberWithFloat:1.0f],
                      nil];
    [keyAn setKeyTimes:times];
    [self.layer addAnimation:keyAn forKey:@"TextAnim"];
}
@end
