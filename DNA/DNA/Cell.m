//
//  Cell.m
//  DNA
//
//  Created by Yaroslav Shukharev on 01.11.12.
//  Copyright (c) 2012 krkmetal. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize DNA;

-(id) init {
    self = [super init];
    
    if (self) {
        DNA = [[NSMutableArray alloc] initWithCapacity:CELL_SIZE];
        
        NSArray *elements_dna = [[NSArray alloc] initWithObjects:@"A", @"G", @"T", @"C", nil];
        
        for (int i = 0; i < CELL_SIZE; i++)
            [DNA addObject:[elements_dna objectAtIndex:arc4random_uniform(4)]];
    }
    
    return self;
}

-(int) hummingDistance: (Cell *) second_cell {
    int count = 0;
    
    for (int i = 0; i < CELL_SIZE; i++)
        if ([DNA objectAtIndex:i] != [[second_cell DNA] objectAtIndex:i])
            count += 1;
    
    return count;
}

@end
