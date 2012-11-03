//
//  Cell.m
//  osx-project-1
//
//  Created by Alex on 31.10.12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import "Cell.h"
#define CAPACITY 100

@implementation Cell

- (id)init {
    self = [super init];
    if(self) {
        NSArray *validDnaSymbols = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        [self setDna:[NSMutableArray arrayWithCapacity:CAPACITY]];
        [self setDna:[self setRandomValues:validDnaSymbols forDna:[self dna]]];
    }
    
    return self;
}

- (id) setRandomValues: (NSArray*) validDnaSymbols forDna:(NSMutableArray*) dna {
    for (int i = 0; i < CAPACITY; i++) {
        [dna addObject:[validDnaSymbols objectAtIndex:arc4random() % [validDnaSymbols count]]];
    }
    
    return dna;
}

- (int)  hammingDistance: (Cell*) cell {
    int distance = 0;
    for (int i = 0; i < [[self dna] count]; i++) {
        if (![[[self dna] objectAtIndex:i] isEqual: [[cell dna] objectAtIndex:i]]) {
            distance++;
        }
    }
    
    return distance;
}

@end
