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
- (CGPoint)origin_zgl {
    return self.frame.origin;
}

- (CGSize)size_zgl {
    return self.frame.size;
}

- (CGFloat)width_zgl {
    return self.frame.size.width;
}

- (CGFloat)height_zgl {
    return self.frame.size.height;
}

- (CGFloat)top_zgl {
    return self.frame.origin.y;
}

- (CGFloat)left_zgl {
    return self.frame.origin.x;
}

- (CGFloat)bottom_zgl {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)right_zgl {
    return self.frame.origin.x + self.frame.size.width;
}

#pragma mark - Setter
- (void)setOrigin_zgl:(CGPoint)origin_zgl {
    CGRect newframe = self.frame;
    newframe.origin = origin_zgl;
    self.frame = newframe;
}

- (void)setSize_zgl:(CGSize)size_zgl {
    CGRect newframe = self.frame;
    newframe.size = size_zgl;
    self.frame = newframe;
}

- (void)setWidth_zgl:(CGFloat)width_zgl {
    CGRect newframe = self.frame;
    newframe.size.width = width_zgl;
    self.frame = newframe;
}

- (void)setHeight_zgl:(CGFloat)height_zgl {
    CGRect newframe = self.frame;
    newframe.size.height = height_zgl;
    self.frame = newframe;
}

- (void)setTop_zgl:(CGFloat)top_zgl {
    CGRect newframe = self.frame;
    newframe.origin.y = top_zgl;
    self.frame = newframe;
}

- (void)setLeft_zgl:(CGFloat)left_zgl {
    CGRect newframe = self.frame;
    newframe.origin.x = left_zgl;
    self.frame = newframe;
}

- (void)setBottom_zgl:(CGFloat)bottom_zgl {
    CGRect newframe = self.frame;
    newframe.origin.y = bottom_zgl - self.frame.size.height;
    self.frame = newframe;
}

- (void)setRight_zgl:(CGFloat)right_zgl {
    CGFloat delta = right_zgl - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta;
    self.frame = newframe;
}
#pragma mark - —————————————————————添加点击事件—————————————————————
- (void)addActionWithblock:(TouchCallBackBlock)block
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

- (void)setTouchCallBackBlock:(TouchCallBackBlock)touchCallBackBlock
{
    objc_setAssociatedObject(self, &BlockKey, touchCallBackBlock, OBJC_ASSOCIATION_COPY);
}

- (TouchCallBackBlock)touchCallBackBlock
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
@end
