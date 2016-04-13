//
//  LINKSubscribeTag.h
//  Test-BS
//
//  Created by 郑博辰 on 16/4/12.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LINKSubscribeTag : NSObject

/** 图标 */
@property (nonatomic, copy) NSString *image_list;
/** 名称 */
@property (nonatomic, copy) NSString *theme_name;
/** 关注数 */
@property (nonatomic, assign) NSInteger sub_number;

@end
