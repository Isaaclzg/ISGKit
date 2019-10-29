//
//  UIView+ISGCategory.h
//  ISGKit
//
//  Created by admin on 2019/4/11.
//

#import <UIKit/UIKit.h>

typedef void(^TouchCallBackBlock)(void);

@interface UIView (ISGCategory)

/*! @brief origin */
@property CGPoint origin_zgl;

/*! @brief size */
@property CGSize size_zgl;

/*! @brief 宽度 */
@property CGFloat width_zgl;

/*! @brief 高度 */
@property CGFloat height_zgl;

/*! @brief 上 */
@property CGFloat top_zgl;

/*! @brief 左 */
@property CGFloat left_zgl;

/*! @brief 下 */
@property CGFloat bottom_zgl;

/*! @brief 右 */
@property CGFloat right_zgl;

@property (nonatomic, copy) TouchCallBackBlock touchCallBackBlock;

/**
 给View添加点击事件

 @param block 添加点击事件
 */
- (void)addActionWithblock:(TouchCallBackBlock)block;

/**
 添加点击事件

 @param target target
 @param action action
 */
- (void)addTarget:(id)target action:(SEL)action;

/*
 周边加阴影，并且同时圆角
 */
- (void)addShadowWithOpacity:(float)shadowOpacity
                shadowRadius:(CGFloat)shadowRadius
             andCornerRadius:(CGFloat)cornerRadius;

@end
