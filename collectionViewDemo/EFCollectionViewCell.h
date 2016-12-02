//
//  EFCollectionViewCell.h
//  collectionViewDemo
//
//  Created by 张海龙 on 16/6/20.
//  Copyright © 2016年 张海龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EFCollectionViewModel.h"
@interface EFCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong)UIView * chatView;
@property (nonatomic, strong)UILabel * label;

@property (nonatomic, assign) EFCollectionViewModel * model;
@property (nonatomic, strong) UIColor * chatColor;
@end
