//
//  Cell.m
//  osx-project-1
//
//  Created by Yuriy Zarovnuy on 07.11.12.
//  Copyright (c) 2012 Yuriy Zarovnuy. All rights reserved.
//

#import "Cell.h"
#import "Nucleotide.h"

@implementation Cell

-(id) init {
    self = [super init];

    if (self)
    {
        _DNALength = 100;
    
        DNA = [[NSMutableArray alloc] init];
    
        for (int i = 0; i < _DNALength; i++) {
            Nucleotide *nucleotide = [[Nucleotide alloc] init];
            [DNA addObject: nucleotide];
        }
    }
    
    return self;
}

-(int) hammingDistance: (Cell*) cell {
    int result = 0;
    
    for (int i = 0; i < _DNALength; i++) {
        Nucleotide *firstNucleotide = [DNA objectAtIndex: i];
        Nucleotide *secondNucleotide = [cell->DNA objectAtIndex: i];
        
        if (![firstNucleotide isEqual: secondNucleotide])
        {
            result++;
        }
    }
    
    return result;
}

@end
