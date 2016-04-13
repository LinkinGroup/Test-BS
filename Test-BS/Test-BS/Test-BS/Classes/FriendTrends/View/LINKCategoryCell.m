//
//  LINKCategoryCell.m
//  Test-BS
//
//  Created by 郑博辰 on 16/4/11.
//  Copyright © 2016年 com.link. All rights reserved.
//

#import "LINKCategoryCell.h"
#import "LINKRecommendCategory.h"

@interface LINKCategoryCell ()

@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;


@end

@implementation LINKCategoryCell

- (void)setCategory:(LINKRecommendCategory *)category
{
    _category = category;
    
    self.textLabel.text = category.name;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 重新调整内部textLabel的frame
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height - 2 * self.textLabel.y;
}

- (void)awakeFromNib {
    self.backgroundColor = LINKRGBColor(244, 244, 244);
    self.selectedIndicator.backgroundColor = LINKRGBColor(219, 21, 26);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    self.selectedIndicator.hidden = !selected;
    self.textLabel.textColor = selected ? self.selectedIndicator.backgroundColor : LINKRGBColor(78, 78, 78);    // Configure the view for the selected state
}



@end
