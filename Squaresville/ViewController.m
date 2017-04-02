//
//  ViewController.m
//  Squaresville
//
//  Created by Tyler Kuster on 3/31/17.
//  Copyright © 2017 Tyler Kuster. All rights reserved.
//

#import "ViewController.h"
#import "SquareCollectionViewCell.h"
#import "MoveCheck.h"


@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, retain) IBOutlet UICollectionView* gameboard;
@property (nonatomic, retain) IBOutlet UILabel* statusLabel;
@property (nonatomic, retain) IBOutlet UIButton* resetButton;

@property (nonatomic, retain) NSMutableSet* playedSquares;

@property (nonatomic, retain) NSMutableSet* playerOneSquares;
@property (nonatomic, retain) NSMutableSet* playerTwoSquares;

@property (nonatomic, assign) Player whosTurn;
@property (nonatomic, assign) MoveCheck* moveCheck;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.playedSquares = [[NSMutableSet alloc] init];
    
    self.playerOneSquares = [[NSMutableSet alloc] init];
    self.playerTwoSquares = [[NSMutableSet alloc] init];
    
    self.whosTurn = PlayerOne;
}

- (IBAction)resetGame
{
    [self.playedSquares removeAllObjects];
    
    [self.playerOneSquares removeAllObjects];
    [self.playerTwoSquares removeAllObjects];
    
    [self.gameboard reloadData];
    
    self.whosTurn = PlayerOne;
    self.statusLabel.text = @"X's Turn";
    
    [UIView animateWithDuration:0.25f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.resetButton.alpha = 0.0f;
                     } completion:nil];
}

#pragma mark - UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.playedSquares containsObject:[NSNumber numberWithInteger:indexPath.row]])
    {
        NSLog(@"Square already played, move ignored.");
        
        return;
    } else if ([MoveCheck checkForWinningMoveSet:self.playerOneSquares] ||
               [MoveCheck checkForWinningMoveSet:self.playerTwoSquares])
    {
        NSLog(@"Game already won, move ignored.");
        
        return;
    } else
    {
        SquareCollectionViewCell* cell = (SquareCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
        [cell setSelected:YES byPlayer:self.whosTurn];
        
        [self.playedSquares addObject:[NSNumber numberWithInteger:indexPath.row]];
        
        [UIView animateWithDuration:0.25f
                              delay:0.0f
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.resetButton.alpha = 1.0f;
                         } completion:nil];
    }
    
    switch (self.whosTurn)
    {
        case PlayerOne:
        {
            [self.playerOneSquares addObject:[NSNumber numberWithInteger:indexPath.row]];
            
            self.whosTurn = PlayerTwo;
            self.statusLabel.text = [MoveCheck checkForWinningMoveSet:self.playerOneSquares] ? @"X Wins!" : @"O's Turn";
            
            break;
        }
        case PlayerTwo:
        {
            [self.playerTwoSquares addObject:[NSNumber numberWithInteger:indexPath.row]];
            
            self.whosTurn = PlayerOne;
            self.statusLabel.text = [MoveCheck checkForWinningMoveSet:self.playerTwoSquares] ? @"O Wins!" : @"X's Turn";
            
            break;
        }
        default:
            break;
    }
}

#pragma mark - CollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 16;
}

- (SquareCollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"squareCell";
    
    SquareCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.squareLabel.text = @"";
    
    return cell;
}

@end
