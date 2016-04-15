//
//  LINKUserCell.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/12.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKUserCell.h"
#import "LINKRecommendUser.h"
#import <UIImageView+WebCache.h>

@interface LINKUserCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headerView;

@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;

@end

@implementation LINKUserCell

- (void)setUser:(LINKRecommendUser *)user
{
    _user = user;
    
    [self.headerView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
        
    self.screenNameLabel.text = user.screen_name;
    
    NSString *fansNumber = nil;
    if (user.fans_count > 10000.0) {
        fansNumber = [NSString stringWithFormat:@"%.1f万人订阅",(user.fans_count / 10000.0)];
    }else{
        fansNumber = [NSString stringWithFormat:@"%zd人订阅",user.fans_count];
    }
    self.fansCountLabel.text = fansNumber;

}

@end
