//
//  SquareCollectionViewCell.m
//  Squaresville
//
//  Created by Tyler Kuster on 3/31/17.
//  Copyright © 2017 Tyler Kuster. All rights reserved.
//

#import "SquareCollectionViewCell.h"


@interface SquareCollectionViewCell ()

@property (nonatomic, retain) IBOutlet UILabel* squareLabel;

@end

@implementation SquareCollectionViewCell

- (void)setSelected:(BOOL)selected byPlayer:(Player)player
{
    [super setSelected:selected];

    switch (player)
    {
        case PlayerOne:
        {
            self.squareLabel.text = @"X";
            
            break;
        }
        case PlayerTwo:
        {
            self.squareLabel.text = @"O";
            
            break;
        }
        default:
            break;
    }
}

@end
