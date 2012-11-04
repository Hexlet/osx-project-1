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
    if (self = [super init]) {
        DNA = [NSMutableArray arrayWithCapacity:100];
        NSArray *Genome = [NSArray arrayWithObjects:@"A", @"C", @"G", @"T", nil];
        
        for (int i = 0; i < 100; ++i) {
            [DNA addObject:[Genome objectAtIndex:arc4random() % 4]];
            
        }
    }
    NSLog(@"%@", DNA);
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

@end
