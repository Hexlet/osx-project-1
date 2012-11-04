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
        int index = arc4random_uniform((uint)[self size]);
        [mutateArray exchangeObjectAtIndex:i withObjectAtIndex:index];
    }
}

-(void) mutate:(int)x{
    // Checks input
    if(x<0 || x>100){
        NSLog(@"ERROR: Can't mutate %d percent of genes!", x);
        exit(EXIT_FAILURE);
    }
    // Avoids useless actions
    else if(x==0){
        return;
    }
    
    // Prepares <mutateArray>
    [self preMutate];
    
    // Calculates number of nucleotides to mutate
    NSUInteger portion = roundtol([self size] * x / 100.0f);
    
    //
    // Mutates first <portion> nucleotides with indices in <mutateArray> - complexity O(n)
    //
    for(int i=0; i<portion; i++){
        // Gets index of nucleotide in DNA to mutate
        int indexInDNA = [[mutateArray objectAtIndex:i] intValue];
        // Removes current value of nucleotide at <indexInDNA> from <nucleotides> string, thus we have new set of possible nucleotides
        NSString *newNucleotides = [[self nucleotides] stringByReplacingOccurrencesOfString:[[self DNA] objectAtIndex:indexInDNA] withString:@""];
        // Randomly chooses an index of new nucleotide in <newNucleotides>
        int indexInNewNucleotides = arc4random_uniform((uint)[newNucleotides length]);
        // Replaces nucleotide in <DNA> at <indexInDNA> by new nucleotide (accesible by <indexInNewNucleotides> in <newNucleotides>)
        [[self DNA] replaceObjectAtIndex:indexInDNA
                              withObject:[newNucleotides substringWithRange:NSMakeRange(indexInNewNucleotides, 1)]];
    }
}

@end
