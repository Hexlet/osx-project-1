//
//  Cell.m
//  DNA
//
//  Created by n on 12.11.12.
//  Copyright (c) 2012 n. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init
{
    // Size of DNA array.
    NSInteger DNAsize = 100;
    
    // Possible elements.
    NSArray *nucleotide = [[NSArray alloc] initWithObjects:@"A", @"C", @"G", @"T", nil];
    
    self = [super init];
    
    // First init of DNA array.
    _DNA = [[NSMutableArray alloc] initWithCapacity:DNAsize];
    
    // Fill with random nucleotides from corresponding array.
    for (NSInteger i=0; i < DNAsize; i++)
    {
        [_DNA setObject:[nucleotide objectAtIndex:arc4random() % [nucleotide count]] atIndexedSubscript:i];
    }
    
    return self;
}

-(int) hammingDistance: (Cell *) cell
{
    int dist = 0;
    
    // In case DNA size of two cells are differents.
    NSInteger minDNAsize = MIN([cell.DNA count], [self.DNA count]);
    NSInteger maxDNAsize = MAX([cell.DNA count], [self.DNA count]);
 
    // Comparing elements.
    for (NSInteger i=0; i<minDNAsize; i++)
    {
        if (![[cell.DNA objectAtIndex:i] isEqualToString:[self.DNA objectAtIndex:i]])
        {
            dist++;
        }
    }
    
    // The tail of one of DNA. Will add 0 in case sizes of DNA are equal.
    dist += (maxDNAsize - minDNAsize);
    
    return dist;
}

@end
