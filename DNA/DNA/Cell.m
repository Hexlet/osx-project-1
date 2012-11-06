//
//  Cell.m
//  DNA
//
//  Created by Alexander Tyaglov on 31.10.12.
//  Copyright (c) 2012 Alexander Tyaglov. All rights reserved.
//

#import "Cell.h"

// Size of DNA array.
u_int32_t const DNASize = 100;

// Array of nucleobases for random selection.
const enum Nucleobase nucleobases[4] = { Adenine, Guanine, Thymine, Cytosine };

@implementation Cell

+ (NSNumber *)randomNucleobase {
    return [NSNumber numberWithChar:nucleobases[arc4random_uniform(4)]];
}

+ (NSNumber *)randomNucleobaseWithExcude:(enum Nucleobase) nucleobase {
    u_int32_t index = arc4random_uniform(4);
    enum Nucleobase newNucleobase = nucleobases[index];
    if (newNucleobase == nucleobase) {
        if (index == 3) {
            newNucleobase = nucleobases[0];
        }
        else {
            newNucleobase = nucleobases[index + 1];
        }
    }
    return [NSNumber numberWithChar:newNucleobase];
}

+ (Cell *)cell {
    return [[Cell alloc] init];
}

+ (Cell *)cellWithCell:(Cell *)cell {
    return [[Cell alloc] initWithCell:cell];
}

- (id)init {
    self = [super init];
    if (self) {
        // Allocating memory and initialize DNA array.
        _DNA = [NSMutableArray arrayWithCapacity:100];
        // Filling DNA array with random nucleobases.
        for (u_int32_t i = 0; i < DNASize; ++i) {
            [_DNA addObject:[Cell randomNucleobase]];
        }
    }
    return self;
}

- (id)initWithCell:(Cell *)cell {
    self = [super init];
    if (self) {
        // Allocating memory and initialize DNA array.
        _DNA = [NSMutableArray arrayWithArray:cell.DNA];
    }
    return self;
}

- (int)hammingDistance:(Cell *)cell {
    int hammingDistance = 0;
    for (u_int32_t i = 0; i < DNASize; ++i) {
        enum Nucleobase nucleobase = [[_DNA objectAtIndex:i] charValue];
        enum Nucleobase nucleobaseOther = [[cell.DNA objectAtIndex:i] charValue];
        if (nucleobase != nucleobaseOther) {
            ++hammingDistance;
        }
    }
    return hammingDistance;
}

- (void)print {
    for (u_int32_t i = 0; i < DNASize; ++i) {
        enum Nucleobase nucleobase = [[_DNA objectAtIndex:i] charValue];
        printf("%c", nucleobase);
    }
    printf("\n");
}

@end