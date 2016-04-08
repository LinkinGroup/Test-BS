//
//  LINKFriendTrendsViewController.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/7.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKFriendTrendsViewController.h"

@implementation LINKFriendTrendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置导航栏标题
    self.navigationItem.title = @"我的关注";
    
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highLightedImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsClick)];
    
    // 设置背景色
    self.view.backgroundColor = XMGGlobalBg;
}

- (void)friendsClick
{
    JKLogFunction;
    
}

@end
