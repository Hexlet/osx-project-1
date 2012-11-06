//
//  Cell+Mutator.m
//  hw1
//
//  Created by Roman Filippov on 06.11.12.
//  Copyright (c) 2012 Roman Filippov. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void) mutateForPercent: (NSUInteger) percent
{
    NSUInteger dnaCount = [_DNA count];
    NSMutableArray *changed = [[NSMutableArray alloc] initWithCapacity:dnaCount];
    for (int i=0; i<dnaCount; ++i) {
        [changed addObject:[NSNumber numberWithBool:NO]];
    }
    
    for (int i=0; i<percent; ++i) {
        int index = arc4random()%dnaCount;
        
        while ([[changed objectAtIndex:index] boolValue] == YES) {
            index = arc4random()%dnaCount;
        }
        
        [_DNA replaceObjectAtIndex:index withObject:[self getSymbol]];
        [changed replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:YES]];
    }
    
    [changed release];
}

@end
