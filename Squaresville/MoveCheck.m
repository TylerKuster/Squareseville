//
//  MoveCheck.m
//  Squaresville
//
//  Created by Tyler Kuster on 3/31/17.
//  Copyright © 2017 Tyler Kuster. All rights reserved.
//

#import "MoveCheck.h"

@implementation MoveCheck

+ (BOOL)checkForWinningMoveSet:(NSSet*)moveSet
{   
    NSArray* winningCombos = [NSArray arrayWithObjects: [MoveCheck allCorners],
                                                        [MoveCheck horizontal0],
                                                        [MoveCheck horizontal1],
                                                        [MoveCheck horizontal2],
                                                        [MoveCheck horizontal3],
                                                        [MoveCheck vertical0],
                                                        [MoveCheck vertical1],
                                                        [MoveCheck vertical2],
                                                        [MoveCheck vertical3],
                                                        [MoveCheck diagonal0],
                                                        [MoveCheck diagonal12],
                                                        [MoveCheck square0],
                                                        [MoveCheck square1],
                                                        [MoveCheck square2],
                                                        [MoveCheck square4],
                                                        [MoveCheck square5],
                                                        [MoveCheck square6],
                                                        [MoveCheck square8],
                                                        [MoveCheck square9],
                                                        [MoveCheck square10], nil];
    
    for (NSSet* set in winningCombos)
    {
        if ([set isSubsetOfSet:moveSet])
        {
            NSLog(@"Player Wins!");
            
            return YES;
        }
    }
    
    return NO;
}

#pragma mark - Corners

+ (NSSet*)allCorners
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:0], [NSNumber numberWithInteger:3], [NSNumber numberWithInteger:12], [NSNumber numberWithInteger:15], nil];
}

#pragma mark - Horizontal

+ (NSSet*)horizontal0
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:0], [NSNumber numberWithInteger:1], [NSNumber numberWithInteger:2], [NSNumber numberWithInteger:3], nil];
}

+ (NSSet*)horizontal1
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:4], [NSNumber numberWithInteger:5], [NSNumber numberWithInteger:6], [NSNumber numberWithInteger:7], nil];
}

+ (NSSet*)horizontal2
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:8], [NSNumber numberWithInteger:9], [NSNumber numberWithInteger:10], [NSNumber numberWithInteger:11], nil];
}

+ (NSSet*)horizontal3
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:12], [NSNumber numberWithInteger:13], [NSNumber numberWithInteger:14], [NSNumber numberWithInteger:15], nil];
}

#pragma mark - Vertical

+ (NSSet*)vertical0
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:0], [NSNumber numberWithInteger:4], [NSNumber numberWithInteger:8], [NSNumber numberWithInteger:12], nil];
}

+ (NSSet*)vertical1
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:1], [NSNumber numberWithInteger:5], [NSNumber numberWithInteger:9], [NSNumber numberWithInteger:13], nil];
}

+ (NSSet*)vertical2
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:2], [NSNumber numberWithInteger:6], [NSNumber numberWithInteger:10], [NSNumber numberWithInteger:14], nil];
}

+ (NSSet*)vertical3
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:3], [NSNumber numberWithInteger:7], [NSNumber numberWithInteger:11], [NSNumber numberWithInteger:15], nil];
}

#pragma mark - Diagonal

+ (NSSet*)diagonal0
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:0], [NSNumber numberWithInteger:5], [NSNumber numberWithInteger:10], [NSNumber numberWithInteger:15], nil];
}

+ (NSSet*)diagonal12
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:12], [NSNumber numberWithInteger:9], [NSNumber numberWithInteger:6], [NSNumber numberWithInteger:3], nil];
}

#pragma mark - 2x2 Square

+ (NSSet*)square0
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:0], [NSNumber numberWithInteger:1], [NSNumber numberWithInteger:4], [NSNumber numberWithInteger:5], nil];
}

+ (NSSet*)square1
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:1], [NSNumber numberWithInteger:2], [NSNumber numberWithInteger:5], [NSNumber numberWithInteger:6], nil];
}

+ (NSSet*)square2
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:2], [NSNumber numberWithInteger:3], [NSNumber numberWithInteger:6], [NSNumber numberWithInteger:7], nil];
}

+ (NSSet*)square4
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:4], [NSNumber numberWithInteger:5], [NSNumber numberWithInteger:8], [NSNumber numberWithInteger:9], nil];
}

+ (NSSet*)square5
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:5], [NSNumber numberWithInteger:6], [NSNumber numberWithInteger:9], [NSNumber numberWithInteger:10], nil];
}

+ (NSSet*)square6
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:6], [NSNumber numberWithInteger:7], [NSNumber numberWithInteger:10], [NSNumber numberWithInteger:11], nil];
}

+ (NSSet*)square8
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:8], [NSNumber numberWithInteger:9], [NSNumber numberWithInteger:12], [NSNumber numberWithInteger:13], nil];
}

+ (NSSet*)square9
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:9], [NSNumber numberWithInteger:10], [NSNumber numberWithInteger:13], [NSNumber numberWithInteger:14], nil];
}

+ (NSSet*)square10
{
    return [[NSSet alloc] initWithObjects:[NSNumber numberWithInteger:10], [NSNumber numberWithInteger:11], [NSNumber numberWithInteger:14], [NSNumber numberWithInteger:15], nil];
}

@end
