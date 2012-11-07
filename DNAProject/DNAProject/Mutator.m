//
//  Mutator.m
//  DNA
//
//  Created by Rudometov on 11/7/12.
//  Copyright (c) 2012 Rudometov. All rights reserved.
//

#import "Mutator.h"
#import "Cell.h"

@implementation Cell (mutator)

// randomly changes the given percentage of DNA symbols
-(void) mutate: (int) percentageOfMutations {
    int cellSize = (int)[DNA count];
    //in case cell size will vary in the future
    int numberOfMutations = percentageOfMutations * cellSize / 100;
    
    //creating random set of indexes for mutations
    NSMutableIndexSet* indexSet = [[NSMutableIndexSet alloc] init];
    while([indexSet count] < numberOfMutations) {
        [indexSet addIndex:arc4random_uniform(cellSize)];
    }
    
    //creating mutations
    NSUInteger index = [indexSet firstIndex];
    
    while(index != NSNotFound) {        
        [DNA replaceObjectAtIndex:index withObject: [self getRandomValueExcept: DNA[index]]];
        index = [indexSet indexGreaterThanIndex: index];
    }
}

@end