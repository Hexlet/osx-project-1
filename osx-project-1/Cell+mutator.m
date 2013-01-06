//
//  Cell+mutator.m
//  osx-project-1
//
//  Created by Nikolay Kushin on 06.01.13.
//  Copyright (c) 2013 Nikolay Kushin. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
-(void)mutate: (int) percent {
    int count = percent * self.DNA.count / 100;
    NSMutableArray* indices = [NSMutableArray arrayWithCapacity: count];
    // create list unique DNA indices to mutate
    while (count > 0) {
        NSNumber* n = [NSNumber numberWithLong: random() % self.DNA.count];
        if ([indices indexOfObject:n] == NSNotFound) {
            [indices addObject:n];
            count--;
        }
    }
    // change elements of DNA
    for (NSNumber* n in indices) {
        [self.DNA setObject:[self.ELEMENTS objectAtIndex: random() % 4] atIndexedSubscript:n.unsignedIntegerValue];
    }
}
@end
