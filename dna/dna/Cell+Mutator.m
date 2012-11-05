//
//  Cell+Mutator.m
//  dna
//
//  Created by Evgeny Trefilov on 11/4/12.
//  Copyright (c) 2012 Evgeny Trefilov. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void) mutate:(int)mutationPercent
{
    if (mutationPercent>0 && mutationPercent<=100) {
        NSUInteger totalGenes=[self length];
        NSUInteger genesToMutate=round(totalGenes/100*mutationPercent);
        
        
        //set of indexes to randomly pull from for mutating 
        NSMutableOrderedSet* indexes=[NSMutableOrderedSet orderedSetWithCapacity:totalGenes];
        for (NSUInteger i=0; i<totalGenes; i++)
            [indexes addObject:[NSNumber numberWithUnsignedLong:i]];
        
        for (NSUInteger i=0; i<genesToMutate; i++) {
            //random index selected once, mutated, then removed from set to avoid mutating same element twice 
            NSUInteger randomIndex=arc4random()%totalGenes;
            [[self getDnaElementAtIndex:randomIndex] mutate];
            [indexes removeObjectAtIndex:randomIndex];
            totalGenes--;
        }
        
    }
    else if(mutationPercent!=0) NSLog(@"Wrong value for n=%i, should be between 0 and 100",mutationPercent);
}

@end
