//
//  Cell+Mutator.m
//  DNATest
//
//  Created by Aliaksandr Słaŭščyk on 01.11.12.
//  Copyright (c) 2012 Aliaksandr Słaŭščyk. All rights reserved.
//

#import "Cell+Mutator.h"

@interface NSMutableArray (Shuffling)
- (void)shuffle;
@end

@implementation NSMutableArray (Shuffling)

- (void)shuffle
{
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i)
    {
        // Select a random element between i and end of array to swap with.
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}
@end

@implementation Cell (Mutator)

- (void) mutate: (int) perc
{
    const int max = 100;
    
    if(perc < 0) perc = 0;
    if(perc > max) perc = max;
    if(perc == 0)
    {
        //нечего менять, уходим
        return;
    }
    NSUInteger dnaCount = [self.DNA count];
    NSUInteger indexesToChange = dnaCount * perc / max;
    NSMutableArray* ids = [[NSMutableArray alloc] initWithCapacity:dnaCount];
    unsigned int i;
    for (i = 0; i < dnaCount; i++)
    {
        [ids addObject:[NSNumber numberWithInt:i]];
    }
    
    if(perc < max)
    {
        [ids shuffle];
    }
    
    for (i = 0; i < indexesToChange; i++)
    {
        int idx = [[ids objectAtIndex:i] intValue];
        [self replaceKeyAtIndex:idx];
    }
    
}
- (void) replaceKeyAtIndex: (int) idx
{
    NSArray *nucleotides = Cell.NUCLEOTIDES;
    NSUInteger nucleotideCount = [nucleotides count];
    NSUInteger curNucleotideIndex = [nucleotides indexOfObject:[self.DNA objectAtIndex:idx]];
    NSUInteger newNucleotideIndex = (curNucleotideIndex + 1 + arc4random_uniform((u_int32_t)(nucleotideCount - 1))) % nucleotideCount;
    [self.DNA replaceObjectAtIndex:idx withObject:[nucleotides objectAtIndex:newNucleotideIndex]];
}
@end
