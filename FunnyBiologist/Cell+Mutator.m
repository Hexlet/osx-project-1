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
    NSUInteger mutated = 0;
    // if we randomly chose different letters, we can chose some letters more then once
    // so we need to store already mutated letters in set
    NSMutableSet *alreadyMutated = [NSMutableSet setWithCapacity:needToMutate];
    while (mutated<needToMutate) {
        int randKey = arc4random() % [self.DNA count];
        // if we didn't mutate this letter - do it
        if(![alreadyMutated containsObject:@(randKey)]) {
            self.DNA[randKey] = [Cell getRandomDNA];
            [alreadyMutated addObject:@(randKey)];
            mutated++;
        }
    }
}

@end