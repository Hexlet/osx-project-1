//
//  Cell.m
//  DNA
//
//  Created by Dm on 10/30/12.
//  Copyright (c) 2012 Dm. All rights reserved.
//

#import "Cell.h"

@implementation Cell

#define CAPACITY 100

-(id) init {
    self = [super init];
    if (self) {
        
        _dna = [NSMutableArray arrayWithCapacity:CAPACITY];
        
        _nucleobase = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
        
        for (int i = 0; i < CAPACITY; i++) {
            [_dna addObject:[_nucleobase objectAtIndex:(arc4random() % [_nucleobase count])]];
        }
        
    }
//    NSLog(@"_dna %@",_dna);
    return  self;
}

-(int) hammingDistance:(Cell *)cell {
    int length = 0;
    for (int i = 0; i < CAPACITY; i++) {
        if (![[[cell dna] objectAtIndex:i] isEqual: [_dna objectAtIndex:i]]) {
            length++;
        }
    }
    return length;
};



@end
