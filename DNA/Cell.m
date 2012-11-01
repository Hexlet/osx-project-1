//
//  Cell.m
//  DNA
//
//  Created by Dm on 10/30/12.
//  Copyright (c) 2012 Dm. All rights reserved.
//

#import "Cell.h"

@implementation Cell

const int capacity = 100;

-(id) init {
    self = [super init];
    if (self) {
        //create empty array with required capacity
        _dna = [NSMutableArray arrayWithCapacity:capacity];
        //create nucleobases array
        _nucleobases = [NSMutableArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
        //add random objects from nucleobases array to dna array
        for (int i = 0; i < capacity; i++) {
            [_dna addObject:[_nucleobases objectAtIndex:(arc4random() % [_nucleobases count])]];
        }
//        NSLog(@"_dna %@",_dna);
    }
    return  self;
}


-(int) hammingDistance:(Cell *)d {
    int diff = 0;
    //compare objects in arrays
    for (int i = 0; i<capacity; i++) {
        if (![[[d dna] objectAtIndex:i] isEqual: [_dna objectAtIndex:i]]) {
            diff++;
        }
    }
//    NSLog(@"diff %i",diff);
    return diff;
};



@end
