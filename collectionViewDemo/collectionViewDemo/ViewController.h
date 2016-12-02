//
//  ViewController.h
//  collectionViewDemo
//
//  Created by 张海龙 on 16/6/20.
//  Copyright © 2016年 张海龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EFCollectionViewFlowLayout.h"
@interface ViewController : UIViewController

@property (nonatomic, strong) NSMutableArray * collectionDataArray;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) NSInteger unSelectIndex;

@end

