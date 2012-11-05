//
//  Cell+mutator.m
//  osx-project-1
//
//  Created by undelalune on 31.10.12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

- (void)mutate:(int)percent
{
    int numElements = [self.DNA count] / 100 * percent;
    int i,rnd1,rnd2;

    NSMutableArray *indexes = [NSMutableArray arrayWithCapacity:[self.DNA count]];

    // add indexes
    for (i = 0; i < [indexes count]; i++)
    {
        [indexes addObject:[NSNumber numberWithInt:i]];
    }
    //shuffle : we can even use a half of this length
    for (i = 0; i < [indexes count]; i++)
    {
        rnd1 = arc4random() % [indexes count];
        rnd2 = [indexes count] - rnd1;
        [indexes exchangeObjectAtIndex:(NSUInteger) rnd1 withObjectAtIndex:(NSUInteger) rnd2];
    }
    //change specific number of elements
    for (i = 0; i < numElements; i++)
    {
        NSString *oldCode = [self.DNA objectAtIndex:(NSUInteger) i];
        [self.DNA replaceObjectAtIndex:(NSUInteger) i withObject:[self getAnotherDNACode:oldCode]];
    }
}

@end
