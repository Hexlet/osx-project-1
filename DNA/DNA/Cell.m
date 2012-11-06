//
//  Cell.m
//  DNA
//
//  Created by Mac on 11/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell 

@synthesize DNA;

-(id) init {
    self = [super init];
    if (self) {
        NSMutableArray *characters = [NSMutableArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        DNA = [[NSMutableArray alloc] initWithCapacity:DNA_SIZE];
        for (int i = 0; i < DNA_SIZE; i++) {
            int nextIndex = arc4random_uniform(4);
            NSString *nextObject = [characters objectAtIndex:nextIndex];
            [DNA addObject:nextObject];
        }
    }
    return self;
}

-(int) hammingDistance: (Cell*) cell {
    int distance = 0;
    NSMutableArray* anotherDNA = cell.DNA;
    for (int i = 0; i < DNA_SIZE; i++) {
        if ([DNA objectAtIndex:i] != [anotherDNA objectAtIndex:i]) {
            distance++;
        }
    }
    return distance;
}

@end
