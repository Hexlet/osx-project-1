//
//  Cell+Mutator.m
//  dna
//
//  Created by Anton Osenenko on 11/4/12.
//  Copyright (c) 2012 Anton Osenenko. All rights reserved.
//

#import "Cell+Mutator.h"
#import "NSMutableArray+Shuffling.h"
#import "Nucleotide.h"

@implementation Cell (Mutator)

- (void)mutate:(int)x {
    int DNASize = (int)[self.DNA count];
    int mutations = (int)round((float)x/100 * DNASize);
    
    NSMutableArray *indexes = [[NSMutableArray alloc] initWithCapacity:DNASize];
    for (int i = 0; i < DNASize; i++) {
        [indexes addObject:[NSNumber numberWithInt:i]];
    }
    [indexes shuffle];
    
    for (int i = 0; i < mutations; i++) {
        int index = [[indexes objectAtIndex:i] intValue];
        Nucleotide *old_nucleotide = [self.DNA objectAtIndex:index];
        Nucleotide *new_nucleotide = [[Nucleotide alloc] initRandomNotAsNucleotide:old_nucleotide];
        [self.DNA replaceObjectAtIndex:index withObject:new_nucleotide];
    }
}

@end
