//
//  Cell.m
//  DNA
//
//  Created by Rudometov on 11/6/12.
//  Copyright (c) 2012 Rudometov. All rights reserved.
//

#import "Cell.h"

@implementation Cell {
    NSArray* dnaPieces;
}

-(id) init {
    self = [super init];
    if (self) {
        int cellSize = 100;
        DNA = [NSMutableArray arrayWithCapacity:cellSize];
        dnaPieces = @[@"A", @"T", @"G", @"C"];
        for (int i = 0; i < cellSize; ++i) {
            [DNA addObject:[self getRandomValue]];
        }
    }
    return self;
}

// generates random value from DNA symbols set
-(NSString*) getRandomValue {
    int rnd = arc4random_uniform((int)[dnaPieces count]);
    return dnaPieces[rnd];
}

// generates random value from DNA symbols excluding given value
-(NSString*) getRandomValueExcept: (NSString*) exceptValue {
    NSString* result;
    do {
        int rnd = arc4random_uniform((int)[dnaPieces count]);
        result = dnaPieces[rnd];
    } while ([result isEqualTo:exceptValue]);
    return result;
}

// calculates the difference between two cells
-(int) hammingDistance: (Cell*) cell {
    int res = 0;
    for (int i = 0; i < [DNA count]; ++i) {
        if ([DNA[i] isNotEqualTo: cell->DNA[i]]) ++res;
    }
    return res;
}

// nice string representation
-(NSString*) toString {
    return [DNA componentsJoinedByString:@""];
}

@end
