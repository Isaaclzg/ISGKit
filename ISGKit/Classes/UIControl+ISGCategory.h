//
//  UIControl+ISGCategory.h
//  ISGKit
//
//  Created by apple on 2023/8/2.
//

#import <UIKit/UIKit.h>

@interface UIControl (ISGCategory)

/// 设置点击时间间隔，默认时间间隔0.5
@property (nonatomic, assign) NSTimeInterval zg_ignoreEventInterval;

/// 是否忽略点击
@property (nonatomic, assign) BOOL zg_ignoreEvent;

@end
