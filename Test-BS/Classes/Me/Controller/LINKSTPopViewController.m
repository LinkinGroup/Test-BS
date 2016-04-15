//
//  LINKSTPopViewController.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/14.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKSTPopViewController.h"
#import <STPopup/STPopup.h>
#import "LINKLoginRegisterViewController.h"


@interface LINKSTPopViewController ()

@end

@implementation LINKSTPopViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"View Controller";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(nextBtnDidTap)];
//        self.contentSizeInPopup = [UIScreen mainScreen].bounds.size;
        self.contentSizeInPopup = CGSizeMake(300, 400);
        self.landscapeContentSizeInPopup = CGSizeMake(200,200);
        
        [[UIBarButtonItem appearanceWhenContainedIn:[STPopupNavigationBar class], nil] setTitleTextAttributes:@{ NSFontAttributeName:[UIFont fontWithName:@"Cochin" size:17] } forState:UIControlStateNormal];

    }
    return self;
}

- (void)nextBtnDidTap
{
    LINKLoginRegisterViewController *logVc = [[LINKLoginRegisterViewController alloc] init];
    [self presentViewController:logVc animated:YES completion:nil];
//    self.view.frame.size = self.contentSizeInPopup;
}

+ (void)initialize
{
    
    STPopupNavigationBar *bar = [STPopupNavigationBar appearance];
    
    [bar setBackgroundColor:[UIColor colorWithRed:0.20 green:0.60 blue:0.86 alpha:1.0]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    
    
    
    
}

@end
