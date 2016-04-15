//
//  UIBarButtonItem+LINKExtension.h
//  Test-BS
//
//  Created by 郑博辰 on 16/4/8.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LINKExtension)

+ (instancetype)itemWithImage:(NSString *)image highLightedImage:(NSString *)highLightedImage target:(id)target action:(SEL)action;

@end
