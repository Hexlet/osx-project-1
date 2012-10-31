//
//  Cell.m
//  DNAProject
//
//  Created by Andrew on 30.10.12.
//  Copyright (c) 2012 AndrewVanyurin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init{
    self = [super init];
    if (self) {
        ATGC = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        _DNA = [NSMutableArray arrayWithCapacity:100];
        NSMutableArray *temp = [NSMutableArray arrayWithCapacity:100];
        for (int i=1; i<=100; i++) {
            [temp addObject:[ATGC objectAtIndex:(arc4random()%[ATGC count])]];
        }
        [self setDNA:[temp copy]];
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
