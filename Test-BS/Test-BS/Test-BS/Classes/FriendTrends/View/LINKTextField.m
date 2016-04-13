//
//  LINKTextField.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/13.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKTextField.h"

static NSString * const LINKPlaceHolderColorKeyPath = @"_placeholderLabel.textColor";

@implementation LINKTextField

- (void)setUp
{
    self.tintColor = self.textColor;
    
    [self resignFirstResponder];
}

- (void)awakeFromNib
{
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

/**
 * 当前文本框聚焦时就会调用
 */
- (BOOL)becomeFirstResponder
{
    // 修改占位文字颜色
    [self setValue:self.textColor forKeyPath:LINKPlaceHolderColorKeyPath];
    
    return [super becomeFirstResponder];
}

/**
 * 当前文本框失去焦点时就会调用
 */
- (BOOL)resignFirstResponder
{
    // 修改占位文字颜色
    [self setValue:[UIColor grayColor] forKeyPath:LINKPlaceHolderColorKeyPath];
    
    return [super resignFirstResponder];
}

@end
