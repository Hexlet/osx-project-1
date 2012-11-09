//
//  Cell.m
//  DNA
//
//  Created by Roman Zhovnirchyk on 2012-11-04.
//  Copyright (c) 2012 Roman Zhovnirchyk. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    
    self = [super init];
    
    if (self) {
        
        dnaCapacity = 100;
        
        // initialization of possible DNA values
        _possibleDnaValues = [[NSArray alloc] initWithObjects: @"A", @"T", @"G", @"C", nil];
        
        // initialization of DNA array
        _dna = [[NSMutableArray alloc] initWithCapacity:dnaCapacity];
        
        // set the dna values with a random value from _possibleDnaValues array
        for (int i = 0; i < dnaCapacity; i++) {
            [_dna addObject:[_possibleDnaValues objectAtIndex:(arc4random() % [_possibleDnaValues count])]];
        }
    }
    
    return self;
}

-(int) hammingDistance: (Cell *) cell {
    
    int counter = 0;
    
    // increase the counter if the values at the same index are not equal in two DNA arrays
    for (int i = 0; i < dnaCapacity; i++) {
        if ([cell.dna objectAtIndex:i] != [_dna objectAtIndex:i]) {
            counter++;
        }
    }
    
    return counter;
}

@end
