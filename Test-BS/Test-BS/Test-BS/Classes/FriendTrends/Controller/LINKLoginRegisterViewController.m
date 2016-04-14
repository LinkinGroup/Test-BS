//
//  LINKLoginRegisterViewController.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/13.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKLoginRegisterViewController.h"
#import <STPopup/STPopup.h>

@interface LINKLoginRegisterViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *LoginViewLeftMargin;

@end

@implementation LINKLoginRegisterViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"View Controller";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(nextBtnDidTap)];
        //        self.contentSizeInPopup = [UIScreen mainScreen].bounds.size;
        self.contentSizeInPopup = CGSizeMake(300, 570);
        self.landscapeContentSizeInPopup = CGSizeMake(200,200);
        
        [[UIBarButtonItem appearanceWhenContainedIn:[STPopupNavigationBar class], nil] setTitleTextAttributes:@{ NSFontAttributeName:[UIFont fontWithName:@"Cochin" size:17] } forState:UIControlStateNormal];
        
    }
    return self;
}

- (void)nextBtnDidTap
{
    
}

- (IBAction)cancleClick:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)loginRegisterClick:(UIButton *)btn {
    
    [self.view endEditing:YES];
    
    if (self.LoginViewLeftMargin.constant == 0) {
        
        self.LoginViewLeftMargin.constant = - self.view.width;
        
        btn.selected = YES;
    }else{
        self.LoginViewLeftMargin.constant = 0;
        
        btn.selected = NO;
    }
    
    [UIView animateWithDuration:0.2 animations:^{

        [self.view layoutIfNeeded];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * 让当前控制器对应的状态栏是白色
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
