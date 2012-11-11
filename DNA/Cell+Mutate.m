//
//  Cell+Mutate.m
//  DNA
//
//  Created by D_Unknown on 11/6/12.
//  Copyright (c) 2012 D_Unknown. All rights reserved.
//

#import "Cell+Mutate.h"

@implementation Cell (Mutate)

-(void) mutate:(int)x {
    //create an array of indexes from 0 to DNA_LENGTH-1 
    NSMutableArray *indexes = [[NSMutableArray alloc] initWithCapacity:DNA_LENGTH];
    NSNumber *ind;
    for(int i=0;i<DNA_LENGTH; i++) {
        ind = [NSNumber numberWithInt:i];
        [indexes addObject:ind];
    }    
    
    NSString *temp;
    NSUInteger randInd;
    NSUInteger index;

    for(NSUInteger i=0; i<((x/100.0)*DNA_LENGTH); i++) {
        do {
            randInd = arc4random()%[indexes count]; //get a random index for indexes array access
            index = [[indexes objectAtIndex:randInd] intValue]; //get an idex from indexes array
            temp = [DNA objectAtIndex:index]; //save present nucleotide value
            [DNA replaceObjectAtIndex:index withObject:[self getNucleotide]]; //replace nucleotide with random nucleotide
        }
        while([[DNA objectAtIndex:index] isEqualTo: temp]); //check if nucleotide has changed. If it hasn't, repeat replacing
        [indexes removeObjectAtIndex:randInd]; //remove the inex of replaced nucleotide
    }
}

@end
