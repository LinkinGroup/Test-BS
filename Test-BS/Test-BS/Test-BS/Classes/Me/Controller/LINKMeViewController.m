//
//  LINKMeViewController.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/7.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKMeViewController.h"

@implementation LINKMeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置导航栏右侧按钮
    
    
    
    //设置导航栏右侧按钮
    UIBarButtonItem *settingButton = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highLightedImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    
    UIBarButtonItem *moonButton = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highLightedImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    
    
    self.navigationItem.rightBarButtonItems = @[settingButton, moonButton];
    
    // 设置背景色
    self.view.backgroundColor = XMGGlobalBg;
                                               
}

- (void)settingClick
{
    JKLogFunction;
}

- (void)moonClick
{
    JKLogFunction;
}

@end
