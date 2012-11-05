//
//  Cell.m
//  DNA
//
//  Created by Daniel Kurapov on 11/2/12.
//  Copyright (c) 2012 Daniel Kurapov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init
{
    self = [super init];
    
    _dna_nucliotide = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    
    if(self)
    {
        _DNA = [NSMutableArray arrayWithCapacity:chain_length];
        for(int i = 0; i < chain_length; ++i)
            [_DNA addObject:[_dna_nucliotide objectAtIndex:arc4random()%[_dna_nucliotide count]]];
    }
    
    return self;
}

-(int) hammingDistance:(Cell *)x_cell
{
    
    NSLog(@"First DNA chain: %@ \n Second DNA chain: %@",self.DNA, x_cell.DNA);
    
    int hamming_distance = 0;
    
    for (int cur_nucliotide = 0; cur_nucliotide < [self.DNA count]; ++cur_nucliotide)
    {
        if ([self.DNA objectAtIndex: cur_nucliotide] != [x_cell.DNA objectAtIndex: cur_nucliotide])
            ++hamming_distance;
    }
    
    NSLog(@"Hamming Distance  = %i",hamming_distance);
    
    return hamming_distance;
}
@end
