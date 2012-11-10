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
    NSNumber *index;
    for(int i=0;i<DNA_LENGTH; i++) {
        index = [NSNumber numberWithInt:i];
        [indexes addObject:index];
    }    
    
    NSString *temp;
    NSUInteger randInd;

    for(NSUInteger i=0; i<((x/100.0)*DNA_LENGTH); i++) {
        do {
            randInd = (int)[indexes objectAtIndex:(arc4random()%[indexes count])]; //get a random index
            temp = [DNA objectAtIndex:randInd]; //save present nucleotide value
            [DNA replaceObjectAtIndex:randInd withObject:[self getNucleotide]]; //change nucleotide
        }
        while([[DNA objectAtIndex:randInd] isEqualTo: temp]); //check if nucleotide has changed. If it hasn't, repeat replacing
        [indexes removeObjectAtIndex:randInd]; //remove the inex of replaced nucleotide
    }
}

@end
