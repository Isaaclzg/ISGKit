//
//  UIView+ISGCategory.h
//  ISGKit
//
//  Created by admin on 2019/4/11.
//

#import <UIKit/UIKit.h>

typedef void(^TouchCallBackBlock)(void);

@interface UIView (ISGCategory)

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

@end
