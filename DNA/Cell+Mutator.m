//
//  Cell+Mutator.m
//  DNA
//
//  Created by Sergey Mitskevich on 11/5/12.
//  Copyright (c) 2012 Sergey Mitskevich. All rights reserved.
//

#import "Cell+Mutator.h"
#import "NSMutableArray+Shuffling.h"

@implementation Cell (Mutator)

- (void) mutate: (int)percentage {
    NSAssert(percentage >= 0 && percentage <= 100,
             @"Percentage should be in range from 0 to 100.");
    if (percentage == 0) return;
    
    // Calculating the number of items we have to change.
    int itemsNum = round(DNA_LENGTH * percentage/100.0);
    
    // Creating an array of indices from 0 to 99.
    NSMutableArray *indices =
        [[NSMutableArray alloc] initWithCapacity:DNA_LENGTH];
    for (int i = 0; i < DNA_LENGTH; i++)
        [indices addObject: [NSNumber numberWithInt:i]];
    
    // Shuffling the indices.
    [indices shuffle];
    
    // Replacing items in DNA, taking indices from our shuffled array.
    int index;
    for (int i = 0; i < itemsNum; i++) {
        index = [[indices objectAtIndex:i] intValue];
        NSString *nucleotide = [self.DNA objectAtIndex:index];
        [self.DNA replaceObjectAtIndex:index
                  withObject: [Cell getRandomNucleotideExcept:nucleotide]];
    }
}

@end


