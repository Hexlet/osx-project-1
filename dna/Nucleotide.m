//
//  Nucleotide.m
//  dna
//
//  Created by Anton Osenenko on 11/5/12.
//  Copyright (c) 2012 Anton Osenenko. All rights reserved.
//

#import "Nucleotide.h"

@implementation Nucleotide

- (Nucleotide *)initRandom {
    self = [super init];
    
    _nucleotideCode = (NucleotideCode)(arc4random() % TOTAL_NUCLEOTIDS);
    
    return self;
}

- (Nucleotide *)initRandomNotAsNucleotide:(Nucleotide *)nucleotide {
    self = [super init];
    
    NSMutableArray *usefullCodes = [[NSMutableArray alloc] init];
    for (int i = 0; i < TOTAL_NUCLEOTIDS; i++) {
        if (i != nucleotide.nucleotideCode) {
            [usefullCodes addObject:[[NSNumber alloc] initWithInt:i]];
        }
    }
    int randomIndex = arc4random() % [usefullCodes count];
    _nucleotideCode = (NucleotideCode)[[usefullCodes objectAtIndex:randomIndex] intValue];
    
    return self;
}

- (BOOL)isEqualToNucleotide:(Nucleotide *)nucleotide {
    return _nucleotideCode == nucleotide.nucleotideCode;
}

@end
