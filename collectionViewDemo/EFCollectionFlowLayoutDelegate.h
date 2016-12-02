//
//  EFCollectionFlowLayoutDelegate.h
//  collectionViewDemo
//
//  Created by 张海龙 on 16/6/20.
//  Copyright © 2016年 张海龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EFCollectionFlowLayoutDelegate <NSObject>

- (void)selectCellIndex:(NSInteger)index unSelectIndex:(NSInteger)unSelectIndex;

@end
