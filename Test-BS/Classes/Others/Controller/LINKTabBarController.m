//
//  LINKTabBarController.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/7.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKTabBarController.h"
#import "LINKEssenceViewController.h"
#import "LINKNewViewController.h"
#import "LINKFriendTrendsViewController.h"
#import "LINKMeViewController.h"
#import "LINKTabBar.h"
#import "LINKNavigationController.h"

@implementation LINKTabBarController

+ (void)initialize
{
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    dict[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedDict = [NSMutableDictionary dictionary];
    selectedDict[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedDict[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:dict forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedDict forState:UIControlStateSelected];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //创建控制器
    [self setUpChildController:[[LINKEssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setUpChildController:[[LINKNewViewController alloc] init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setUpChildController:[[LINKFriendTrendsViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setUpChildController:[[LINKMeViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];

    // 更换tabBar
//     self.tabBar 为read-only
    [self setValue:[[LINKTabBar alloc] init] forKeyPath:@"tabBar"];
    
}

- (void)setUpChildController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.navigationController.title = title;
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    LINKNavigationController *nav = [[LINKNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}

@end
