//
//  LINKGuideView.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/13.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKGuideView.h"

@implementation LINKGuideView

+ (instancetype)guideView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

+ (void)show
{
    NSString *key = @"CFBundleShortVersionString";
    
    // 获得当前软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    // 获得沙盒中存储的版本号
    NSString *sanboxVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    
    if (![currentVersion isEqualToString:sanboxVersion]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        LINKGuideView *guideView = [LINKGuideView guideView];
        //获得尺寸
        guideView.frame = window.bounds;
        //添加到窗口
        [window addSubview:guideView];
        
        // 存储版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (IBAction)close
{
    [self removeFromSuperview];
    
}


@end
