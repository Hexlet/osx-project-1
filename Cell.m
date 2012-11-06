//
//  Cell.m
//  DNAProject
//
//  Created by Andrew on 30.10.12.
//  Copyright (c) 2012 AndrewVanyurin. All rights reserved.
//

#import "Cell.h"
#import "Cell+mutator.h"

extern NSArray const *ATGC;

@implementation Cell

- (id)init{
    
    self = [super init];
    if (self) {
        _DNA = [NSMutableArray arrayWithCapacity:100];
        for (int i=0; i<100; i++) {
            [[self DNA] addObject:[ATGC objectAtIndex:(arc4random()%[ATGC count])]];
        }
    }
    return self;
}

-(int) hammingDistance: (Cell *)c{
    int rez = 0;
    
    for (NSUInteger i = 0; i < [[self DNA] count]; i++) {
        if (![[[self DNA] objectAtIndex:i] isEqual: [[c DNA] objectAtIndex:i]]) {
            rez++;
        }
    }

    return rez;
}

@end

