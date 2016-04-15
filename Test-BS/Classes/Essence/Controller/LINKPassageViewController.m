//
//  LINKPassageViewController.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/14.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKPassageViewController.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>

@interface LINKPassageViewController ()

/** 帖子数据 */
@property (nonatomic, strong) NSArray *topics;

@end

@implementation LINKPassageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @"29";
    
    // 发送请求
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.topics = responseObject[@"list"];
        
        [self.tableView reloadData];
        //        [responseObject writeToFile:@"/Users/xiaomage/Desktop/duanzi.plist" atomically:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];

}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    NSDictionary *topic = self.topics[indexPath.row];
    cell.textLabel.text = topic[@"name"];
    cell.detailTextLabel.text = topic[@"text"];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:topic[@"profile_image"]] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    return cell;
}

@end
