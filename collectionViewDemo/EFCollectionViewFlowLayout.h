//
//  EFCollectionViewFlowLayout.h
//  collectionViewDemo
//
//  Created by 张海龙 on 16/6/20.
//  Copyright © 2016年 张海龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EFCollectionFlowLayoutDelegate.h"
@interface EFCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id<EFCollectionFlowLayoutDelegate>delegate;

@property (nonatomic, assign) NSInteger cellCount;
@property (nonatomic, assign) NSInteger cellUnSelectIndex;

@end
