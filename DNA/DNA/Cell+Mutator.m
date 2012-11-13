//
//  Cell+Mutator.m
//  DNA
//
//  Created by n on 13.11.12.
//  Copyright (c) 2012 n. All rights reserved.
//

#import "Cell+Mutator.h"
#import "NSMutableArray+Shuffle.h"

@implementation Cell (Mutator)

-(void) mutate: (int) percentToReplace
{
    // Explicit number of element to replace.
    NSInteger replace = percentToReplace * [self DNAsize] / 100;
    
    // Some preparation in case of data out of range.
    if (replace < 0)
        replace = 0;
    if (replace > [self DNAsize])
        replace = [self DNAsize];
    
    // Nothing to do here.
    if (replace == 0)
        return;
    
    NSInteger i = 0;
    
    // Array that stores indices to replace.
    NSMutableArray *indicesToReplace = [[NSMutableArray alloc] initWithCapacity:[self DNAsize]];
    for (i = 0; i < [self DNAsize]; i++)
        [indicesToReplace setObject:[NSNumber numberWithInteger:i] atIndexedSubscript:i];
    // Shuffle it!
    [indicesToReplace shuffle];
    
    // To store generated nucleotide.
    NSString *tempNucleotide = [[NSString alloc] init];
    NSInteger DNAindex = 0;
    
    for (i = 0; i < replace; i++)
    {
        // Index of DNA array.
        DNAindex = [[indicesToReplace objectAtIndex:i] integerValue];
        // Generate string different from that in DNA array.
        do
        {
            tempNucleotide = [self randomNucleotide];
        }
        while ([[self getDNAatIndex:DNAindex] isEqualToString:tempNucleotide]);
        
        [self setDNA:tempNucleotide atIndex:DNAindex];
    }
}

@end
