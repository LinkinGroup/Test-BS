//
//  LINKMeViewController.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/7.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKMeViewController.h"
#import "LINKSTPopViewController.h"
#import <STPopup.h>
#import "LINKLoginRegisterViewController.h"


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
    self.view.backgroundColor = LINKGlobalBg;
                                               
}

- (void)settingClick
{
    LINKLoginRegisterViewController *logVc = [[LINKLoginRegisterViewController alloc] init];
    STPopupController *popupController = [[STPopupController alloc] initWithRootViewController:logVc];

    
//    STPopupController *popupController = [[STPopupController alloc] initWithRootViewController:[LINKSTPopViewController new]];
    
//    STPopupNavigationBar *bar = [STPopupNavigationBar appearance];
//    
//    [bar setBackgroundColor:[UIColor colorWithRed:0.20 green:0.60 blue:0.86 alpha:1.0]];
    
    [popupController presentInViewController:self];
}

- (void)moonClick
{
    JKLogFunction;
}

@end
