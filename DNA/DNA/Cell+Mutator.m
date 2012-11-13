//
//  Cell+Mutator.m
//  DNA
//
//  Created by n on 13.11.12.
//  Copyright (c) 2012 n. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate: (int) percentToReplace
{
    NSInteger replace = percentToReplace;
    
    // Explicit number of element to replace.
    replace = replace * [self DNAsize] / 100;
    
    // Some preparation in case of data out of range.
    if (replace < 0)
        replace = 0;
    if (replace > [self DNAsize])
        replace = [self DNAsize];
    
    if (replace == 0)
        return;
    
    // Array to store the indices to replace.
    NSMutableArray *indicesToReplace = [[NSMutableArray alloc] initWithCapacity:replace];
    
    // Temporary var to store generated index to add to indicesToReplace.
    NSNumber *tempIndex = [[NSNumber alloc] init];
    NSInteger i = 0;
    
    while (i < replace)
    {
        // Generate next index.
        tempIndex = [NSNumber numberWithInteger:arc4random() % [self DNAsize]];
        // Avoiding repeating indices.
        // I know that it's very time consuming but for this task it's OK.
        if (![indicesToReplace containsObject:tempIndex])
        {
            [indicesToReplace setObject:tempIndex atIndexedSubscript:i];
            i++;
        }
    }
    
    // Possible elements of DNA.
    NSArray *nucleotide = [[NSArray alloc] initWithObjects:@"A", @"C", @"G", @"T", nil];
    NSString *tempNucleotide = [[NSString alloc] init];
    NSInteger DNAindex = 0;
    
    for (i = 0; i<[indicesToReplace count]; i++)
    {
        // Index of DNA array.
        DNAindex = [[indicesToReplace objectAtIndex:i] integerValue];
        // Generate string different from that in DNA array.
        do
        {
            tempNucleotide = [nucleotide objectAtIndex:arc4random() % [nucleotide count]];
        }
        while ([[self getDNAatIndex:DNAindex] isEqualToString:tempNucleotide]);
        
        [self setDNA:tempNucleotide atIndex:DNAindex];
    }
}

@end
