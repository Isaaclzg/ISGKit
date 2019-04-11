//
//  UIImage+ISGCategory.h
//  ISGKit
//
//  Created by admin on 2019/4/11.
//

#import <UIKit/UIKit.h>

@interface UIImage (ISGCategory)

/**
 use session compress Strategy
 */
- (UIImage *)sg_SessionCompress;

/**
 use timeline compress Strategy
 */
- (UIImage *)sg_TimelineCompress;

/**
 *  通过UIColor创建UIImage
 *
 *  @param color 颜色
 *
 *  @return UIImage
 */
- (UIImage*)createImageWithColor:(UIColor *)color;
@end
