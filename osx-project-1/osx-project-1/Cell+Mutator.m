//
//  Cell+Mutator.m
//  osx-project-1
//
//  Created by Anton Melnikov on 11/6/12.
//  Copyright (c) 2012 Anton Melnikov. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void)mutate:(int)rate
{
    if ((rate < 0) || (rate > 100))
    {
        @throw [NSException exceptionWithName:@"Out of range" reason:@"Rate must be specified in percents (betwееn 0% and 100%)" userInfo:nil];
    }
        
    int dnaSize = [self dnaCapacity];
    int changesCount = (int)((((double)rate) / 100.0) * ((double)dnaSize));
    
    int *indexesToChange = malloc(sizeof(int) * dnaSize);
    for (int i = 0; i < dnaSize; i++)
    {
        indexesToChange[i] = i;
    }
    for (int i = 0; i < changesCount; i++)
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
        NucleotidesEnum new = rand() % (NucleotidesEnumMax - 1);
        
        if (new >= old)
        {
            new++;
        }
        
        [self replaceNucleotideAtIndex:n with:new];
    }
    
    free(indexesToChange);
}

@end
