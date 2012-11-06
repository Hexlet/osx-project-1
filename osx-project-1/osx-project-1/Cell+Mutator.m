//
//  Cell+Mutator.m
//  osx-project-1
//
//  Created by Anton Melnikov on 11/6/12.
//  Copyright (c) 2012 Anton Melnikov. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void)mutate:(double)rate
{
    if ((rate < 0.0) || (rate > 100.0))
    {
        @throw [NSException exceptionWithName:@"Out of range" reason:@"Rate must be specified in percents (betwееn 0% and 100%)" userInfo:nil];
    }
        
    int dnaSize = [self dnaCapacity];
    int changesCount = (int)((rate / 100.0) * ((double)dnaSize));
    
    int *indexesToChange = malloc(sizeof(int) * dnaSize);
    for (int i = 0; i < dnaSize; i++)
    {
        indexesToChange[i] = i;
    }
    for (int i = 0; i < dnaSize; i++)
    {
        int n = rand() % dnaSize;
        
        int tmp = indexesToChange[i];
        indexesToChange[i] = indexesToChange[n];
        indexesToChange[n] = tmp;
    }
    
    for (int i = 0; i < changesCount; i++)
    {
        int n = indexesToChange[i];
        NucleotidesEnum old = [self nucleotideAtIndex:n];
        NucleotidesEnum new = rand() % NucleotidesEnumMax;
        
        if (new == old)
        {
            new = (new + 1) % NucleotidesEnumMax;
        }
        
        [self replaceNucleotideAtIndex:n with:new];
    }
}

@end
