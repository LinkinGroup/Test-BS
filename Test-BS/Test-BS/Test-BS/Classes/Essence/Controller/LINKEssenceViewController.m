//
//  LINKEssenceViewController.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/7.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKEssenceViewController.h"
#import "LINKNewViewController.h"

@implementation LINKEssenceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置导航栏标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //设置导航栏左侧按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highLightedImage:@"MainTagSubIconClick" target:self action:@selector(menuClick)];
    
    // 设置背景色
    self.view.backgroundColor = XMGGlobalBg;
}

- (void)menuClick
{
    LINKNewViewController *new = [[LINKNewViewController alloc] init];

    [self.navigationController pushViewController:new animated:YES];
}

@end
