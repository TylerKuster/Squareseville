//
//  MoveCheck.h
//  Squaresville
//
//  Created by Tyler Kuster on 3/31/17.
//  Copyright © 2017 Tyler Kuster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoveCheck : NSObject

+ (BOOL)checkForWinningMoveSet:(NSMutableSet*)moveSet;

@end
