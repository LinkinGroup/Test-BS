//
//  LINKSubscribeCell.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/12.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKSubscribeCell.h"
#import <UIImageView+WebCache.h>
#import "LINKSubscribeTag.h"

@interface LINKSubscribeCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation LINKSubscribeCell

- (void)setSubTag:(LINKSubscribeTag *)subTag
{
    _subTag = subTag;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:subTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    self.nameLabel.text = subTag.theme_name;
    NSString *subNumber = nil;
    if (subTag.sub_number > 10000.0) {
        subNumber = [NSString stringWithFormat:@"%.1f万人订阅",(subTag.sub_number / 10000.0)];
    }else{
        subNumber = [NSString stringWithFormat:@"%zd人订阅",subTag.sub_number];
    }
    self.countLabel.text = subNumber;
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 6;
    frame.size.width -= 2 * frame.origin.x;
    frame.size.height -= 1;
    
    [super setFrame:frame];
    
}

@end
