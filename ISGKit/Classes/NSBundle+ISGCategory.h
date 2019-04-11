//
//  NSBundle+ISGCategory.h
//  ISGKit
//
//  Created by admin on 2019/4/11.
//

#import <Foundation/Foundation.h>

@interface NSBundle (ISGCategory)

/**
 获取文件所在name，默认情况下podName和bundlename相同，传一个即可
 
 @param bundleName bundle名字，就是在resource_bundles里面的名字
 @param podName pod的名字
 @return bundle
 */
+ (NSBundle *)bundleWithBundleName:(NSString *)bundleName
                           podName:(NSString *)podName;

@end
