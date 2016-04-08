//
//  LINKNavigationController.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/9.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKNavigationController.h"

@implementation LINKNavigationController

+ (void)initialize
{
    // 当导航栏用在XMGNavigationController中, appearance设置才会生效
    //    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
    UINavigationBar *bar = [UINavigationBar appearance];
    
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:(UIBarMetricsDefault)];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

/**
 * 可以在这个方法中拦截所有push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0 ) {
        
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        
        [btn setTitle:@"返回" forState:(UIControlStateNormal)];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:(UIControlStateNormal)];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [btn setTitleColor:[UIColor redColor] forState:(UIControlStateHighlighted)];
        btn.size = CGSizeMake(81, 36);
        
        // 让按钮内部的所有内容左对齐
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //        [btn sizeToFit];
        // 让按钮的内容往左边偏移10
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popToRootViewControllerAnimated:YES];
}

@end
