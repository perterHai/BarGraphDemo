//
//  ViewController.m
//  collectionViewDemo
//
//  Created by 张海龙 on 16/6/20.
//  Copyright © 2016年 张海龙. All rights reserved.
//

#import "ViewController.h"
#import "EFCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,EFCollectionFlowLayoutDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) UIImageView * selectImage;

@end

static NSString * cellID = @"testCell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setUpData];
    [self setUpSubViews];
}

- (void)setUpSubViews
{
    for (int i =0 ; i < 3; i ++) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 60 +50*i, 20,10)];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:10];
        label.text = @"test";
        [self.view addSubview:label];
        UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 60+ 50*i+10,self.view.frame.size.width, 1)];
        lineView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:lineView];
    }
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.selectImage];
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:self.collectionDataArray.count-1 inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.collectionDataArray.count-1 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

//可以根据网络刷新来加载数据
- (void)setUpData
{
    for (int index = 0; index < 20 ; index ++) {
        EFCollectionViewModel * model = [[EFCollectionViewModel alloc]init];
        model.timeIndex = index;
        model.chatHeight = arc4random()%200;
        [self.collectionDataArray addObject:model];
    }
}

-(NSMutableArray *)collectionDataArray
{
    if (!_collectionDataArray) {
        _collectionDataArray = [[NSMutableArray alloc]init];
    }
    return _collectionDataArray;
}

#pragma  mark - uiscrollview delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:self.index inSection:0];
    EFCollectionViewCell * cell = (EFCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    cell.chatColor = [UIColor redColor];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:99 inSection:0];
    EFCollectionViewCell * cell = (EFCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    cell.chatColor = [UIColor redColor];
}

#pragma mark - layOut delegate

-(void)selectCellIndex:(NSInteger)index unSelectIndex:(NSInteger)unSelectIndex
{
    self.index = index;
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:unSelectIndex inSection:0];
    EFCollectionViewCell * cell = (EFCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    cell.chatColor = [UIColor greenColor];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.collectionDataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EFCollectionViewCell *cell = (EFCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.chatColor = [UIColor greenColor];
    cell.model = [self.collectionDataArray objectAtIndex:indexPath.row];
    return cell;
}


-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        EFCollectionViewFlowLayout * flowLayout = [[EFCollectionViewFlowLayout alloc]init];
        flowLayout.delegate = self;
        flowLayout.cellCount = 10;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumInteritemSpacing = self.view.frame.size.width/10/10;
        flowLayout.minimumLineSpacing = self.view.frame.size.width/10/10;
        flowLayout.itemSize = CGSizeMake(self.view.frame.size.width/10, 210);
        flowLayout.sectionInset = UIEdgeInsetsMake(0, self.view.frame.size.width/2-self.view.frame.size.width/10/2 , 0, self.view.frame.size.width/2-self.view.frame.size.width/10/2);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 210) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[EFCollectionViewCell class] forCellWithReuseIdentifier:cellID];
        _collectionView.scrollEnabled = NO;
    }
    return _collectionView;
}

-(UIImageView *)selectImage
{
    if (!_selectImage) {
        _selectImage = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-20)/2, CGRectGetMaxY(self.collectionView.frame)-20, 20, 20)];
        _selectImage.backgroundColor = [UIColor whiteColor];
    }
    return _selectImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
