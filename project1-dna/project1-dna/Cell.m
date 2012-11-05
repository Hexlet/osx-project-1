//
//  Cell.m
//  project1-dna
//
//  Created by DaZzz on 02.11.12.
//  Copyright (c) 2012 DaZzz. All rights reserved.
//

#import "Cell.h"

// To get random symbol (usage in Cell class)
@implementation NSMutableArray (Random)

-(id)randomObject {
    if ([self count] == 0)
        [NSException raise: @"Invalid operation" format: @"Can't get a random object from empty array."];
    uint32_t rnd = arc4random_uniform((uint32_t)[self count]);
    return [self objectAtIndex: rnd];
}

@end

// To get random indexes (usage in Mutator category)
@implementation NSMutableArray (Shuffle)

// To swap objects in array
- (void) swap: (int)i with: (int)j {
    NSObject *temp = [self objectAtIndex: i];
    [self replaceObjectAtIndex: i withObject:[self objectAtIndex: j]];
    [self replaceObjectAtIndex: j withObject: temp];
}

// Shuffling elements of the array
- (void) shuffle {
    int n = (int)[self count];
    for (int i = 0; i < n; ++i) {
        int change = i + (int)arc4random_uniform(n-i);
        [self swap: i with: change];
    }
    
}

@end

// Main class
@implementation Cell

// Simple initializes
- (id)init {
    if (self = [super init]) {
        // Init DNA
        _DNA = [[NSMutableArray alloc] initWithCapacity: CELL_SIZE];
        
        // Array of simbols
        _symbols = [NSMutableArray arrayWithObjects:@'A', @'T', @'G', @'C', nil];
        
        //Filling DNA with random elements of symbols array
        for (int i = 0; i < CELL_SIZE; ++i)
            [_DNA addObject:[_symbols randomObject] ];
    }
    return self;
}

// Hamming distance
- (int)hammingDistanceTo: (Cell*)aCell {
    int counter = 0;
    for (int i = 0; i < CELL_SIZE; ++i)
        // if thisDNA[i] != thatDNA[i] then ++counter
        if ([_DNA objectAtIndex: i] != [aCell.DNA objectAtIndex: i])
            ++counter;
    return counter;
}

// Just for debug (toString() equivalent)
- (NSString *)description {
    NSMutableString * mstr = [NSMutableString stringWithString: @""];
    for (int i = 0; i < [_DNA count]; ++i)
        [mstr appendString: [_DNA objectAtIndex: i]];
    
    return [mstr description];
}

@end


