//
//  LINKFriendTrendsViewController.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/7.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKFriendTrendsViewController.h"
#import "LINKRecommendViewController.h"
#import "FUIButton.h"
#import "LINKLoginRegisterViewController.h"

@interface LINKFriendTrendsViewController ()

@end

@implementation LINKFriendTrendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置导航栏标题
    self.navigationItem.title = @"我的关注";
    
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highLightedImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsClick)];
    
    // 设置背景色
    self.view.backgroundColor = LINKGlobalBg;
    
    //添加按钮
    FUIButton *btn = [FUIButton buttonWithType:(UIButtonTypeCustom)];
    btn.size = CGSizeMake(180, 63);
    btn.center = CGPointMake(LINKScreenSize.width * 0.5, LINKScreenSize.height * 0.5);
    //    FUIButton *topBtn = [[FUIButton alloc] initWithFrame:CGRectMake(35, 300, 100, 30)];
    btn.buttonColor = [UIColor purpleColor];
    btn.shadowColor  = [UIColor blackColor];
    btn.highlightedColor  = [UIColor purpleColor];
    btn.disabledColor  = [UIColor grayColor];
    btn.disabledShadowColor  = [UIColor cyanColor];
//    [btn setTitleColor:LINKRGBColor(198, 198, 198) forState:(UIControlStateHighlighted)];
    btn.shadowHeight = 6.0;
    btn.cornerRadius = 9;
    [btn setTitle:@"立即注册登陆" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:27];
    //设置后没有效果
    btn.titleLabel.shadowOffset = CGSizeMake(1, 5);
    btn.titleLabel.shadowColor = [UIColor blackColor];
    
    [btn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
}

- (void)loginClick
{
    LINKLoginRegisterViewController *logVc = [[LINKLoginRegisterViewController alloc] init];
    
    [self presentViewController:logVc animated:YES completion:nil];
}

- (void)friendsClick
{
    LINKRecommendViewController *vc = [[LINKRecommendViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
