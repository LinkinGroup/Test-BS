//
//  LINKSubscribeViewController.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/12.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKSubscribeViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import "LINKSubscribeTag.h"
#import <MJExtension.h>
#import "LINKSubscribeCell.h"

@interface LINKSubscribeViewController ()<UITableViewDataSource>

/** 模型数组*/
@property (nonatomic, strong) NSArray *tags;


@end

@implementation LINKSubscribeViewController

static NSString * const LINKTagID = @"tag";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTableView];
    
    [self loadData];
}

- (void)loadData
{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeBlack)];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.tags = [LINKSubscribeTag mj_objectArrayWithKeyValuesArray: responseObject];
        
        [self.tableView reloadData];
        
        [SVProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
    }];
}

- (void)setUpTableView
{
    self.title = @"推荐订阅";
    
    self.tableView.rowHeight = 72;
    
    self.tableView.backgroundColor = LINKGlobalBg;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LINKSubscribeCell class]) bundle:nil] forCellReuseIdentifier:LINKTagID];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tags.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LINKSubscribeCell *cell = [tableView dequeueReusableCellWithIdentifier:LINKTagID];
    
    cell.subTag = self.tags[indexPath.row];
    
    return cell;
}

@end
