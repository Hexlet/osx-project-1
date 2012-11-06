//
//  Cell.m
//  HomeWork1
//
//  Created by fluke on 31.10.12.
//  Copyright (c) 2012 fluke. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];

    if (self) {
        capacity = 100;
        DNA = [[NSMutableArray alloc] initWithCapacity:capacity];
        genes = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];

        for (int i = 0; i < capacity; i++) {
            NSUInteger index = random() % [genes count];
            [DNA addObject:[genes objectAtIndex:index]];
        }
    }

    return self;
}

-(int) hammingDistance:(Cell *)cell {
    int count = 0;

    for (NSUInteger i = 0; i < capacity; i++) {
        if ([DNA objectAtIndex:i] != [cell->DNA objectAtIndex:i])
            count++;
    }

    return count;
}

@end
