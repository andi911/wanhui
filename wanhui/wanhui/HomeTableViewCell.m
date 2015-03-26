//
//  HomeTableViewCell.m
//  wanhui
//
//  Created by liangyu on 15-3-26.
//  Copyright (c) 2015年 cloudn. All rights reserved.
//
#import "common.h"
#import "HomeTableViewCell.h"

@implementation HomeTableViewCell


- (TemplateView *)newsTemplateContainerView{
    if (!self.templateview) {
    self.templateview = [[TemplateView alloc] initWithFrame:CGRectMake(kXHNewsTemplateContainerViewSpacing, kXHNewsTemplateContainerViewSpacing, CGRectGetWidth([[UIScreen mainScreen] bounds]) - kXHNewsTemplateContainerViewSpacing * 2, kXHNewsTemplateContainerViewHeight)];
    }
    return self.templateview;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self.contentView addSubview:self.templateview];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
