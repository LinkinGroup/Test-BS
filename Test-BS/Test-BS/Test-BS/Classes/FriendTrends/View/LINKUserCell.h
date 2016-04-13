//
//  LINKUserCell.h
//  Test-BS
//
//  Created by 郑博辰 on 16/4/12.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LINKRecommendUser;

@interface LINKUserCell : UITableViewCell

/** 用户模型*/
@property (nonatomic, strong) LINKRecommendUser *user;

@end
