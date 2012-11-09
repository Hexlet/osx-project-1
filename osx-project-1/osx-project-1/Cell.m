//
//  Cell.m
//  osx-project-1
//
//  Created by Anton Melnikov on 11/6/12.
//  Copyright (c) 2012 Anton Melnikov. All rights reserved.
//

#import "Cell.h"

const int dnaSize = 100;

@implementation Cell
{
    NSMutableArray *dna;
}

-(id)init
{
    self = [super init];
    
    if (self)
    {
        dna = [[NSMutableArray alloc] init];
        for (int i = 0; i < dnaSize; i++)
        {
            [dna addObject:[NSNumber numberWithInt:(rand() % NucleotidesEnumMax)]];
        }
    }
    
    return self;
}

-(int)dnaCapacity
{
    return dnaSize;
}

-(NucleotidesEnum)nucleotideAtIndex:(int)index
{
    NSNumber *result = (NSNumber*)[dna objectAtIndex:index];
    return [result intValue];
}

-(void)replaceNucleotideAtIndex:(int)index with:(NucleotidesEnum)nucleotide
{
    if (nucleotide >= NucleotidesEnumMax)
    {
        @throw [NSException exceptionWithName:@"Invalid nucleotide" reason:@"Nucleotide must be \"A\", \"T\", \"G\" or \"C\"" userInfo:nil];
    }
    
    [dna replaceObjectAtIndex:index withObject:[NSNumber numberWithInt:nucleotide]];
}

-(int)hammingDistanceWith:(Cell *)otherCell
{
    int result = 0;
    
    for (int i = 0; i < dnaSize; i++)
    {
        if (![[dna objectAtIndex:i] isEqual:[otherCell->dna objectAtIndex:i]])
        {
            result++;
        }
    }
    
    return result;
}

@end
