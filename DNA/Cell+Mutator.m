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
    
    // Calculating the number of items we have to change.
    int itemsNum = round(DNA_LENGTH * percentage/100.0);
    
    // Creating an array of numbers from 0 to 99
    NSMutableArray *range =
        [[NSMutableArray alloc] initWithCapacity:DNA_LENGTH];
    for (int i = 0; i < DNA_LENGTH; i++)
        [range addObject: [NSNumber numberWithInt:i]];
    
    // Shuffling the range of numbers
    [range shuffle];
    
    // Replacing items in our DNA by taking indexes from our shuffled range
    int position;
    for (int i = 0; i < itemsNum; i++) {
        position = [[range objectAtIndex:i] intValue];
        NSString *nucleotide = [self.DNA objectAtIndex:position];
        [self.DNA replaceObjectAtIndex:position
                  withObject: [Cell getRandomNucleotideExcept:nucleotide]];
    }
}

@end


