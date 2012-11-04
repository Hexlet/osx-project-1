//
//  Cell+Mutator.m
//  dna
//
//  Created by Evgeny Trefilov on 11/4/12.
//  Copyright (c) 2012 Evgeny Trefilov. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void) mutate:(int)n
{
    if (n>0 && n<=100) {
        NSUInteger totalGenes=[self.dna count];
        NSUInteger genesToMutate=round(totalGenes/100*n);
        
        NSMutableOrderedSet* indexes=[NSMutableOrderedSet orderedSetWithCapacity:totalGenes];
        for (NSUInteger i=0; i<totalGenes; i++)
            [indexes addObject:[NSNumber numberWithUnsignedLong:i]];
        
        for (NSUInteger i=0; i<genesToMutate; i++) {
            NSUInteger randomIndex=arc4random()%totalGenes;
            [self.dna[randomIndex] mutate];
            [indexes removeObjectAtIndex:randomIndex];
            totalGenes--;
        }
        
    }
    else if(n>100) NSLog(@"Wrong value for n=%i, should be between 0 and 100",n);
}

@end
