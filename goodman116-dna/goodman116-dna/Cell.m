//
//  Cell.m
//  goodman116-dna
//
//  Created by goodman116 on 11/5/12.
//  Copyright (c) 2012 goodman116. All rights reserved.
//

#import "Cell.h"

int size = 100;

@implementation Cell

-(id) init {
    self = [super init];
    if (self) {
        _nucleotides = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        _dna = [NSMutableArray arrayWithCapacity:size];
        for (int i = 0; i < size; i++) { 
            [_dna addObject: self.getRandomNucleotide];
        }
    }
    return self;
}

-(void) print {
    NSLog(@"%@", _dna);
}

-(NSString *)getRandomNucleotide {
    return [_nucleotides objectAtIndex: arc4random_uniform((int)[_nucleotides count])];
}

-(int) hammingDistance:(Cell *)c {
    uint distance = 0;
    for (uint i = 0; i < size; i++) {
        if (![[c.dna objectAtIndex:i] isEqualTo:[self.dna objectAtIndex:i]]) {
            distance++;
        }
    }
    return distance;
}

-(Cell *)clone {
    Cell *c = [[Cell alloc] init];
    for (int i = 0; i < size; i++) {
        [c.dna setObject:[self.dna objectAtIndex:i] atIndexedSubscript:i];
    }
    return c;
}

@end
