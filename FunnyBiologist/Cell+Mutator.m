//
//  Cell+Mutator.m
//  FunnyBiologist
//
//  Created by Paul Dmitryev on 31.10.12.
//  Copyright (c) 2012 Paul Dmitryev. All rights reserved.
//

#import "Cell.h"
#import "Cell+Mutator.h"

@implementation Cell(Mutator)

-(void)mutate:(NSUInteger) percent {
    NSCAssert((percent>0) && (percent<=100), @"Invalid percentage!");
    // calculate, how many DNA letters we need to mutate (handle custom DNA_SIZE)
    NSUInteger needToMutate = lround(percent/100.0 * DNA_SIZE);

    // we need to avoid repeated mutations of the same cells, so we'll create another array
    // filled with indexes, take it's random elements, use them as keys to DNA array
    // and remove this key from indexes array
    NSMutableArray *indexes = [NSMutableArray array];
    for (NSUInteger i=0; i<DNA_SIZE; i++) {
        [indexes addObject:@(i)];
    }
    for (NSUInteger mutated=0; mutated<needToMutate; mutated++) {
        NSUInteger randKey = arc4random() % [indexes count];
        NSUInteger randIndex = [indexes[randKey] integerValue];
        [indexes removeObjectAtIndex:randKey];
        NSString *new_letter;
        // if we got the same letter as we have - got another one
        do {
            new_letter = [Cell getRandomDNA];
        } while (new_letter==self.DNA[randIndex]);
        
        self.DNA[randIndex] = new_letter;
    }
}

@end