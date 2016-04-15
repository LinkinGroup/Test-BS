//
//  LINKEssenceViewController.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/7.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKEssenceViewController.h"
#import "LINKSubscribeViewController.h"
#import "LINKAllViewController.h"
#import "LINKVideoViewController.h"
#import "LINKVoiceViewController.h"
#import "LINKPictureViewController.h"
#import "LINKPassageViewController.h"


@interface LINKEssenceViewController ()<UIScrollViewDelegate>

/** 标签栏底部的红色指示器 */
@property (nonatomic, weak) UIView *indicatorView;
/** 当前选中的按钮 */
@property (nonatomic, weak) UIButton *selectedButton;
/** 顶部的所有标签 */
@property (nonatomic, weak) UIView *titlesView;

/** ScrollView*/
@property (nonatomic, weak) UIScrollView *contentView;


@end

@implementation LINKEssenceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpNav];
    
    [self setUpChildViewController];
    
    [self setUpScrollView];
    
    [self setupTitlesView];
    
    
}

#pragma mark - 导航栏初始化
- (void)setUpNav
{
    //设置导航栏标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //设置导航栏左侧按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highLightedImage:@"MainTagSubIconClick" target:self action:@selector(menuClick)];
    
    // 设置背景色
    self.view.backgroundColor = LINKGlobalBg;
    
}

- (void)menuClick
{
    LINKSubscribeViewController *sub = [[LINKSubscribeViewController alloc] init];
    
    [self.navigationController pushViewController:sub animated:YES];
}

#pragma mark - 标题栏
- (void)setupTitlesView
{
    // 标签栏整体
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    titlesView.width = self.view.width;
    titlesView.height = 35;
    titlesView.y = 64;
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    // 底部的红色指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.tag = -1;
    indicatorView.height = 2;
    indicatorView.y = titlesView.height - indicatorView.height;
    [titlesView addSubview:indicatorView];
    self.indicatorView = indicatorView;
    
    // 内部的子标签
    NSArray *titles = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    CGFloat width = titlesView.width / titles.count;
    CGFloat height = titlesView.height;
    for (NSInteger i = 0; i<titles.count; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.tag = i;
        button.height = height;
        button.width = width;
        button.x = i * width;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        //        [button layoutIfNeeded]; // 强制布局(强制更新子控件的frame)
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:button];
        
        // 默认点击了第一个按钮
        if (i == 0) {
            button.enabled = NO;
            self.selectedButton = button;
            
            // 让按钮内部的label根据文字内容来计算尺寸
            [button.titleLabel sizeToFit];
            self.indicatorView.width = button.titleLabel.width;
            self.indicatorView.centerX = button.centerX;
        }
    }
    [titlesView addSubview:indicatorView];
}

- (void)titleClick:(UIButton *)button
{
    // 修改按钮状态
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    
    // 动画
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.width = button.titleLabel.width;
        self.indicatorView.centerX = button.centerX;
    }];
    
    //滚动
    CGPoint offset = self.contentView.contentOffset;
    offset.x = button.tag * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
    
}

#pragma mark - scrollView
- (void)setUpChildViewController
{
    LINKAllViewController *allVc = [[LINKAllViewController alloc] init];
    [self addChildViewController:allVc];
    
    LINKVideoViewController *videoVc = [[LINKVideoViewController alloc] init];
    [self addChildViewController:videoVc];
    
    LINKVoiceViewController *voiceVc = [[LINKVoiceViewController alloc] init];
    [self addChildViewController:voiceVc];
    
    LINKPictureViewController *picVc = [[LINKPictureViewController alloc] init];
    [self addChildViewController:picVc];
    
    LINKPassageViewController *passageVc = [[LINKPassageViewController alloc] init];
    [self addChildViewController:passageVc];
    
}

#pragma mark - scrollView
- (void)setUpScrollView
{
    //别让系统来调尺寸
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //初始化设置
    UIScrollView *contentView = [[UIScrollView alloc] init];
    contentView.frame = self.view.bounds;
    contentView.pagingEnabled = YES;
    contentView.delegate = self;
    [self.view insertSubview:contentView atIndex:0];
    
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
    
    self.contentView = contentView;
    
    //添加打开软件时出现的那个控制器
    [self scrollViewDidEndScrollingAnimation:contentView];
    
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 当前的索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    // 取出子控制器
    UITableViewController *vc = self.childViewControllers[index];
    vc.view.x = scrollView.contentOffset.x;
    vc.view.y = 0; // 设置控制器view的y值为0(默认是20)
    vc.view.height = scrollView.height; // 设置控制器view的height值为整个屏幕的高度(默认是比屏幕高度少个20)
    
    // 设置内边距
    CGFloat bottom = self.tabBarController.tabBar.height;
    CGFloat top = CGRectGetMaxY(self.titlesView.frame);
    vc.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    // 设置滚动条的内边距
    vc.tableView.scrollIndicatorInsets = vc.tableView.contentInset;
    [scrollView addSubview:vc.view];

    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    // 点击按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self titleClick:self.titlesView.subviews[index]];
}



@end
