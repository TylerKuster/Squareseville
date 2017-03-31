//
//  SquareCollectionViewCell.h
//  Squaresville
//
//  Created by Tyler Kuster on 3/31/17.
//  Copyright © 2017 Tyler Kuster. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    PlayerOne,
    PlayerTwo,
} Player;

@interface SquareCollectionViewCell : UICollectionViewCell

- (void)setSelected:(BOOL)selected byPlayer:(Player)player;

@end
