//
//  EFCollectionViewFlowLayout.m
//  collectionViewDemo
//
//  Created by 张海龙 on 16/6/20.
//  Copyright © 2016年 张海龙. All rights reserved.
//

#import "EFCollectionViewFlowLayout.h"

@implementation EFCollectionViewFlowLayout

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    NSLog(@"proposedContentOffset----%.f",proposedContentOffset.x);
    CGFloat pointX = [[UIScreen mainScreen] bounds].size.width/_cellCount + [[UIScreen mainScreen] bounds].size.width/_cellCount/_cellCount;
    int index = proposedContentOffset.x /pointX;
    NSLog(@"index---%d",index);
    if ([self.delegate respondsToSelector:@selector(selectCellIndex: unSelectIndex:)]) {
        [self.delegate selectCellIndex:index unSelectIndex:self.cellUnSelectIndex];
        self.cellUnSelectIndex = index;
    }
    return CGPointMake(index * pointX, 0);
}


@end
