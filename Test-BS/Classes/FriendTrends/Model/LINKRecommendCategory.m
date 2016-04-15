//
//  LINKRecommendCategory.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/11.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKRecommendCategory.h"

@implementation LINKRecommendCategory

- (NSMutableArray *)users
{
    if (!_users) {
        _users = [NSMutableArray array];
    }
    return _users;
}

@end
