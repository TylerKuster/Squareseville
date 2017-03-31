//
//  GameBoardCollectionView.m
//  Squaresville
//
//  Created by Tyler Kuster on 3/31/17.
//  Copyright © 2017 Tyler Kuster. All rights reserved.
//

#import "GameboardCollectionView.h"


@interface GameboardCollectionView () <UICollectionViewDataSource>

@end

@implementation GameboardCollectionView

- (void)commonInit
{
    self.dataSource = self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self){
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self){
        [self commonInit];
    }
    return self;
}

#pragma mark - CollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 16;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"squareCell";
    
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    UILabel* squareLabel = (UILabel*)[cell viewWithTag:100];
    
    squareLabel.text = @"";
    
    return cell;
}

@end
