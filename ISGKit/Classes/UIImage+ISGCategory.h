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

@end
