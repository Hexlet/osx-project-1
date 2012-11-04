//
//  Cell+mutator.m
//  dna-project-1
//
//  Created by Apple on 11/3/12.
//  Copyright (c) 2012 Alexander Gedranovich. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

static NSMutableArray *mutateArray = nil;

-(void) preMutate{
    // First call only part: initialization of <mutateArray> with sequential numbers
    if(!mutateArray){
        mutateArray = [[NSMutableArray alloc] initWithCapacity:[self size]];
        for(int i=0; i<[self size]; i++){
            [mutateArray addObject:[NSNumber numberWithInt:i]];
        }
    }
    
    // Each call part: random permutation of numbers - complexity O(n)
    for(int i=0; i<[self size]; i++){
        int index = arc4random() % [self size];
        [mutateArray exchangeObjectAtIndex:i withObjectAtIndex:index];
    }
}

-(void) mutate:(int)x{
    // Checks input
    if(x<0 || x>100){
        NSLog(@"Can't mutate %d percent of genes!", x);
        return;
    }
    
    // Prepares <mutateArray>
    [self preMutate];
    
    // Calculates number of items to mutate
    NSUInteger portion = [self size] * x / 100;
    
    //
    // Mutates first <portion> items with indices in <mutateArray>
    //
    
    // Copies DNA to <newDNA>, which will be changed
    NSMutableArray *newDNA = [NSMutableArray arrayWithArray:[self DNA]];
    for(int i=0; i<portion; i++){
        // Gets index in DNA to mutate
        int indexInDNA = [[mutateArray objectAtIndex:i] intValue];
        // Removes current value of gene at <indexInDNA> from <genes> string, thus we have new set of possible genes
        NSString *newGenes = [[self genes] stringByReplacingOccurrencesOfString:[newDNA objectAtIndex:indexInDNA] withString:@""];
        // Randomly chooses an index of new gene in <newGenes>
        int indexInNewGenes = arc4random() % [newGenes length];
        // Replaces gene in <newDNA> at <indexInDNA> by new gene (accesible by <indexInNewGene> in <newGenes>)
        [newDNA replaceObjectAtIndex:indexInDNA
                          withObject:[newGenes substringWithRange:NSMakeRange(indexInNewGenes, 1)]];
    }
    // Replaces DNA with modified <newDNA>
    [self setDNA:newDNA];
}

@end
