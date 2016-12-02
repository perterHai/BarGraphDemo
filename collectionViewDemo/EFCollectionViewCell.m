//
//  EFCollectionViewCell.m
//  collectionViewDemo
//
//  Created by 张海龙 on 16/6/20.
//  Copyright © 2016年 张海龙. All rights reserved.
//

#import "EFCollectionViewCell.h"

@implementation EFCollectionViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.chatView];
        [self addSubview:self.label];
    }
    return self;
}

- (void)setModel:(EFCollectionViewModel *)model
{
    _model = model;
    self.label.text = [NSString stringWithFormat:@"%d",(int)model.timeIndex%24];
}
- (void)setChatColor:(UIColor *)chatColor
{
    _chatColor = chatColor;
    self.chatView.backgroundColor = _chatColor;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _chatView.frame = CGRectMake(0, self.frame.size.height-self.model.chatHeight-10, self.frame.size.width, self.model.chatHeight);
    _label.frame = CGRectMake(0, self.frame.size.height -10, self.frame.size.width, 10);
}

- (UIView *)chatView
{
    if (!_chatView) {
        _chatView = [[UIView alloc]init];
    }
    return _chatView;
}

-(UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.text = @"test";
        _label.font = [UIFont systemFontOfSize:10];
    }
    return _label;
}

@end
