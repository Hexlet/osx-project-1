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
    
    _nucleotideCode = (NucleotideCode)(arc4random() % (int)(C + 1));
    
    return self;
}

- (BOOL)isEqualToNucleotide:(Nucleotide *)nucleotide {
    return _nucleotideCode == nucleotide.nucleotideCode;
}

@end
