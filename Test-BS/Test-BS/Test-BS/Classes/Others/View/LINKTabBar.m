//
//  LINKTabBar.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/7.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKTabBar.h"

@interface LINKTabBar ()

@property (weak, nonatomic) UIButton *publishButton;

@end

@implementation LINKTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIButton *publishButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:(UIControlStateNormal)];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:(UIControlStateHighlighted)];
        
        [self addSubview:publishButton];
        
        self.publishButton = publishButton;
        NSLog(@"%d",[self.publishButton isKindOfClass:[UIButton class]]);
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //设置发布按钮的frame;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    self.publishButton.width = self.publishButton.currentBackgroundImage.size.width;
    self.publishButton.height = self.publishButton.currentBackgroundImage.size.height;
    self.publishButton.center = CGPointMake(width * 0.5, height * 0.5);
    
    //设置其他按钮的frame;
    CGFloat buttonW = width / 5;
    CGFloat buttonH = height;
    CGFloat buttonY = 0;
    CGFloat buttonX = 0;
    
    NSInteger index = 0;
    
    for (UIView *button in self.subviews) {
        if (![button isKindOfClass:[UIControl class]] || button == self.publishButton) {continue;}
        
        buttonX = buttonW * ((index > 1)?(index + 1):index);
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        
        
        index++;
        
    }
}

@end
