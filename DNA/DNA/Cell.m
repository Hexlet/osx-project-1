//
//  Cell.m
//  DNA
//
//  Created by artem on 11/13/12.
//  Copyright (c) 2012 Wilfred. All rights reserved.
//

#import "Cell.h"


@implementation Cell

-(id) init {
    self = [super init];
    if (self) {
        DNA = [[NSMutableArray alloc] init];
        for (int i = 0; i < DNA_length; ++i) {
            long newElement = random();
            char DNA_elem;
            if (newElement % 4 == 0) {
                DNA_elem = 'A';
            }
            if (newElement % 4 == 1) {
                DNA_elem = 'T';
            }
            if (newElement % 4 == 2) {
                DNA_elem = 'G';
            }
            if (newElement % 4 == 3) {
                DNA_elem = 'C';
            }
            [DNA addObject:[NSString stringWithFormat:@"%c", DNA_elem]];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *) other_cell {
    int current_hamming_distance = 0;
    for (int i = 0; i < DNA_length; ++i) {
        if ([self->DNA objectAtIndex:i] != [other_cell->DNA objectAtIndex:i]) {
            current_hamming_distance++;
        }
    }
    return current_hamming_distance;
}
	
@end
