//
//  Cell.m
//  Cells
//
//  Created by Vladimir Korshunov on 11/4/12.
//  Copyright (c) 2012 Vladimir Korshunov. All rights reserved.
//

#import "Cell.h"
#import <stdlib.h>

@implementation Cell {
    NSMutableArray *DNA;
}

- (id) init {
    NSArray *Genome = [NSArray arrayWithObjects:@"A", @"C", @"G", @"T", nil];
    NSMutableArray *arrayDNA = [NSMutableArray arrayWithCapacity:100];
    for (int i = 0; i < 100; ++i) {
        [arrayDNA addObject:[Genome objectAtIndex:arc4random() % 4]];
        
    }
    
    if (self = [self initWithArray:arrayDNA]) {
        // Awesome !
    }
    return self;
}

- (id) initWithArray:(NSArray *)arrayDNA {
    if (self = [super init]) {
        DNA = [NSMutableArray arrayWithArray:arrayDNA];
    }
    return self;
}

- (NSString *) genomeAtIndex:(int)index {
    return [DNA objectAtIndex:index];
}

- (int) hammingDistance:(Cell *)another {
    int count = 0;
    
    for (int i = 0; i < [DNA count]; ++i) {
        if ([self genomeAtIndex:i] != [another genomeAtIndex:i]) {
            ++count;
        }
    }
    
    return count;
}

- (void) mutator:(int)persent {
    if (persent > 100 && persent < 0){
        NSLog(@"Error: bad value");
        return ;
    }
    
    NSArray *Genome = [NSArray arrayWithObjects:@"A", @"C", @"G", @"T", nil];

    Cell *MutableDNA = [[Cell alloc] initWithArray:DNA];
    while (persent > [self hammingDistance:MutableDNA]) {
        [DNA replaceObjectAtIndex:(arc4random() % [DNA count]) withObject:[Genome objectAtIndex:arc4random() % 4]];
    }
}

@end
