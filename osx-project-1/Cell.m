//
//  Cell.m
//  osx-project-1
//
//  Created by Alex on 31.10.12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init {
    self = [super init];
    if(self) {
        [self setDna:[NSMutableArray arrayWithCapacity:CAPACITY]];
        [self setRandomValues];
    }
        
    return self;
}

- (void) setRandomValues {
    NSArray *validDnaSymbols = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
    for (int i = 0; i < CAPACITY; i++) {
        [_dna addObject:[validDnaSymbols objectAtIndex:arc4random() % [validDnaSymbols count]]];        
    }
}

- (int)  hammingDistance: (Cell*) cell {
    int distance = 0;
    for (int i = 0; i < [[self dna] count]; i++) {
        if ([[_dna objectAtIndex:i] isNotEqualTo: [[cell dna] objectAtIndex:i]]) {
            distance++;
        }
    }
    
    return distance;
}

@end
