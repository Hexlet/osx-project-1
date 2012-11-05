//
//  Cell.m
//  dna
//
//  Created by Anton Osenenko on 11/4/12.
//  Copyright (c) 2012 Anton Osenenko. All rights reserved.
//

#import "Cell.h"
#import "Nucleotide.h"

const int DNASize = 100;

@implementation Cell

- (Cell *)init {
    self = [super init];
    
    _DNA = [[NSMutableArray alloc] initWithCapacity:DNASize];
    for (int i=0; i < DNASize; i++) {
        [_DNA addObject:[[Nucleotide alloc] initRandom]];
    }
    
    return self;
}

- (int)hammingDistance:(Cell *)cell {
    int distance = 0;
    
    for (int i=0; i < DNASize; i++) {
        if (![_DNA[i] isEqualToNucleotide:cell.DNA[i]]) {
            distance++;
        }
    }
    
    return distance;
}

@end
