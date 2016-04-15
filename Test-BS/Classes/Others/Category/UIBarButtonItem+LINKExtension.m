//
//  UIBarButtonItem+LINKExtension.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/8.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "UIBarButtonItem+LINKExtension.h"

@implementation UIBarButtonItem (LINKExtension)

+ (instancetype)itemWithImage:(NSString *)image highLightedImage:(NSString *)highLightedImage target:(id)target action:(SEL)action
{
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    [button setBackgroundImage:[UIImage imageNamed:image] forState:(UIControlStateNormal)];
    [button setBackgroundImage:[UIImage imageNamed:highLightedImage] forState:(UIControlStateHighlighted)];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    
    return [[self alloc] initWithCustomView:button];

}

@end
