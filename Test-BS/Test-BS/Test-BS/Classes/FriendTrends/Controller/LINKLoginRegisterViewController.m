//
//  LINKLoginRegisterViewController.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/13.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKLoginRegisterViewController.h"

@interface LINKLoginRegisterViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *LoginViewLeftMargin;

@end

@implementation LINKLoginRegisterViewController

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
