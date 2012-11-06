//
//  Cell+Mutator.m
//  DNA
//
//  Created by Alexander Tyaglov on 01.11.12.
//  Copyright (c) 2012 Alexander Tyaglov. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void)mutate:(int)percentage {
    if (percentage < 1 || percentage > 100) {
        NSLog(@"Mutation percentage must be greater then 0 and lesser then 100!");
        return;
    }
    
    // Find out nucleobases to change count.
    u_int32_t nucleobasesToChangeCount = (u_int32_t)percentage * DNASize / 100;
    // Create an array of indexes.
    NSMutableArray *indexes = [NSMutableArray arrayWithCapacity:DNASize];
    // and fill it with indexes.
    for (u_int32_t i = 0; i < DNASize; ++i) {
        [indexes addObject:[NSNumber numberWithUnsignedInt:i]];
    }
    // Find out nucleobases to change.
    u_int32_t indexesCount = DNASize;
    for (u_int32_t i = 0; i < nucleobasesToChangeCount; ++i) {
        // Random index of indexes array.
        u_int32_t indexesIndex = arc4random_uniform(indexesCount);
        // Index of DNA array.
        u_int32_t index = [[indexes objectAtIndex:indexesIndex] unsignedIntValue];
        // Current nucleobase at selected index.
        enum Nucleobase currentNucleobase = [[self.DNA objectAtIndex:index] charValue];
        // New random nucleobase.
        NSNumber *nucleobase = [Cell randomNucleobaseWithExcude:currentNucleobase];
        // Replace nucleobase in DNA with random nucleobase.
        [self.DNA replaceObjectAtIndex:index withObject:nucleobase];
        // Remove index of changed nucleobase from indexes array.
        [indexes removeObjectAtIndex:indexesIndex];
        // Decrease not selected indexes count.
        --indexesCount;
    }
}

@end