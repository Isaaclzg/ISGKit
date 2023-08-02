//
//  UIView+ISGCategory.h
//  ISGKit
//
//  Created by admin on 2019/4/11.
//

#import <UIKit/UIKit.h>

typedef void(^ZGTouchCallBackBlock)(void);
@interface UIView (ISGCategory)

/*! @brief origin */
@property CGPoint origin_zg;

/*! @brief size */
@property CGSize size_zg;

/*! @brief 宽度 */
@property CGFloat width_zg;

/*! @brief 高度 */
@property CGFloat height_zg;

/*! @brief 上 */
@property CGFloat top_zg;

/*! @brief 左 */
@property CGFloat left_zg;

/*! @brief 下 */
@property CGFloat bottom_zg;

/*! @brief 右 */
@property CGFloat right_zg;

@property (nonatomic, copy) ZGTouchCallBackBlock _Nullable touchCallBackBlock;

/**
 给View添加点击事件

 @param block 添加点击事件
 */
- (void)addActionWithblock:(ZGTouchCallBackBlock _Nullable )block;

/**
 添加点击事件

 @param target target
 @param action action
 */
- (void)addTarget:(id _Nullable )target action:(SEL _Nullable )action;

/*
 周边加阴影，并且同时圆角
 */
- (void)addShadowWithOpacity:(float)shadowOpacity
                shadowRadius:(CGFloat)shadowRadius
             andCornerRadius:(CGFloat)cornerRadius;

/// 设置圆角
/// @param radius 圆角度数
- (void)zg_setRadius:(CGFloat)radius;

/// 设置边框
/// @param borderColor 边框颜色
/// @param borderWidth 边框宽度
- (void)zg_setBorder:(UIColor *_Nullable)borderColor
         borderWidth:(CGFloat)borderWidth;

/// 设置任意圆角及边框(实线/虚线)
/// @param corners 要设置的圆角位置集合
/// @param radius 圆角度数
/// @param lineWidth 边框宽度
/// @param lineColor 边框颜色
/// @param lineDashPattern 虚线集合
- (void)zg_addCorners:(UIRectCorner)corners
             radius:(CGFloat)radius
         lineWidth:(CGFloat)lineWidth
         lineColor:(UIColor *_Nullable )lineColor
                 dash:(NSArray<NSNumber *>*_Nullable )lineDashPattern;

/// 视图添加抖动
- (void)zg_shake;
@end
