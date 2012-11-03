//
//  Cell+mutator.m
//  DNAProject
//
//  Created by Admin on 11/2/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)


//  Replaces given percentage of nucleotides in DNA chain with random values
//
//  @param percent
//              Percentage of nucleotides to mutate
//  @return void

-(void) mutate: (int)percent {
   
    // in case incorrect percentage do not mutate
    if( percent <= 0 || percent > 100)
        return;
    
    // calculate number of replaces
    int numChanges = floor( (double)(SIZE_DNA / 100.0) * percent);
    
    // generate set of unique indexes to change
    NSMutableIndexSet* indexSet = [NSMutableIndexSet indexSet];
    
    while([indexSet count] < numChanges) {
        [indexSet addIndex: rand() % SIZE_DNA];
    }
    
    // iterate through indexes
    for ( NSInteger i = [indexSet firstIndex]; i != NSNotFound; i = [indexSet indexGreaterThanIndex: i ]) {
        
        NSString *nucl;
        
        // do mutation
        do {
            nucl  = [self getRandomNucleotide];
            if( ![[dna objectAtIndex:i ] isEqualToString: nucl ]) {
                [dna replaceObjectAtIndex:i withObject:nucl];
                break;
            }
        } while (true);
    }
    
    NSLog(@"Mutated index set: %@", indexSet);
}

@end
