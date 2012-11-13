//
//  Cell.m
//  DNA
//
//  Created by n on 12.11.12.
//  Copyright (c) 2012 n. All rights reserved.
//

#import "Cell.h"

@implementation Cell
{
    NSMutableArray *DNA;
}

-(id) init
{
    self = [super init];
    
    if (self)
    {
        // Size of DNA array.
        int DNAsize = 100;
        
        // Possible elements.
        NSArray *nucleotide = [[NSArray alloc] initWithObjects:@"A", @"C", @"G", @"T", nil];
        
        // First init of DNA array.
        DNA = [[NSMutableArray alloc] initWithCapacity:DNAsize];
        
        // Fill with random nucleotides from corresponding array.
        for (NSInteger i=0; i < DNAsize; i++)
        {
            [DNA setObject:[nucleotide objectAtIndex:arc4random() % [nucleotide count]] atIndexedSubscript:i];
        }
    }
    
    return self;
}

-(int) hammingDistance: (Cell *) cell
{
    int dist = 0;
    
    // In case DNA size of two cells are differents.
    NSInteger minDNAsize = MIN([cell DNAsize], [self DNAsize]);
    NSInteger maxDNAsize = MAX([cell DNAsize], [self DNAsize]);
 
    // Comparing elements.
    for (NSInteger i=0; i<minDNAsize; i++)
    {
        if (![[cell getDNAatIndex:i] isEqualToString:[self getDNAatIndex:i]])
        {
            dist++;
        }
    }
    
    // The tail of one of DNA. Will add 0 in case sizes of DNA are equal.
    dist += (maxDNAsize - minDNAsize);
    
    return dist;
}

-(NSInteger) DNAsize
{
    return [DNA count];
}

-(NSString *) getDNAatIndex: (NSInteger)index
{
    if ((index < 0) || (index >= [self DNAsize]))
        return nil;
    return [DNA objectAtIndex:index];
}

-(void) setDNA: (NSString *) nucluotide atIndex: (NSInteger)index
{
    if ((index >= 0) && (index < [self DNAsize]))
    {
        [DNA setObject:nucluotide atIndexedSubscript:index];
    }
}

-(void) printDNA
{
    NSMutableString *output = [[NSMutableString alloc] init];
    for (NSInteger i = 0; i < [self DNAsize]; i++)
    {
        [output appendString: [self getDNAatIndex:i]];
    }
    NSLog(@"%@", output);
}

@end
