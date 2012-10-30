//
//  Cell+mutator.m
//  osx-project-1
//
//  Created by undelalune on 31.10.12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

- (void)mutate:(int)numElements
{
    int rnd;
    NSMutableArray *dnaIndexes = [NSMutableArray new];
    for (int j = 0; j < numElements; j++)
    {
        rnd = arc4random() % [self.DNA count];

        while ([dnaIndexes containsObject:[NSNumber numberWithInt:rnd]])
        {
            rnd = arc4random() % [self.DNA count];
        }
        [dnaIndexes addObject:[NSNumber numberWithInt:rnd]];
        NSString *oldCode = [self.DNA objectAtIndex:(NSUInteger) rnd];
        [self.DNA replaceObjectAtIndex:(NSUInteger) rnd withObject:[self getAnotherDNACode:oldCode]];
    }
}

@end
