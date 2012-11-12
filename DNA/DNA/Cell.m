//
//  Cell.m
//  DNA
//
//  Created by Arthur Belous on 05.11.12.
//  Copyright (c) 2012 Arthur Belous. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init
{
    _DNA = [NSMutableArray arrayWithCapacity:100];
    NSString * letters = @"ATGC"; // Create letters string
    self = [super init];
    if (self)
    {
        for (int i=0; i<100; i++) //fill array
        {
            int arrayElement = arc4random() % [letters length];
            [_DNA addObject:[NSString stringWithFormat:@"%c",[letters characterAtIndex:arrayElement]]];
        }
    }
    return self;
}

-(int) hammingDistance :(Cell*) myCell
{
    int distanceCount = 0;
    //----  Compare Arrays by elements in cikl
    for (int x = 0; x < 100; x++)
    {
        if ([[myCell DNA] objectAtIndex:x] != [_DNA objectAtIndex:x])
        {
            NSLog(@"Step, %i", x);
            NSLog(@"Arra1, %@", [_DNA objectAtIndex:x]);
            NSLog(@"Array2 %@", [[myCell DNA] objectAtIndex:x]);
            distanceCount ++;
        }
        
    }
NSLog(@"Distance is %i  pare of letters", distanceCount);
return distanceCount;
}


@end
