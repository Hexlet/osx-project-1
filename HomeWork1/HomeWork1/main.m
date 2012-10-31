//
//  main.m
//  HomeWork1
//
//  Created by fluke on 31.10.12.
//  Copyright (c) 2012 fluke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void)mutate:(int)x;
@end

@implementation Cell (mutator)
-(void)mutate:(int)x {
    int toChange = round(capacity * x / 100);
    NSUInteger i = 0;
    id newGene;
    NSMutableIndexSet *changed = [[NSMutableIndexSet alloc] init];

    while ([changed count] < toChange) {
        do {
            i = random() % capacity;
        }
        while ([changed containsIndex:i]);

        [changed addIndex:i];

        do {
            newGene = [genes objectAtIndex:(random() % [genes count])];
        }
        while ([[DNA objectAtIndex:i] isEqualToString:newGene]);

        [DNA replaceObjectAtIndex:i withObject:newGene];
    }
}
@end

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];

        NSLog(@"%@", cell1);
        NSLog(@"%@", cell2);
        NSLog(@"Hamming distance: %i", [cell1 hammingDistance:cell2]);

        [cell1 mutate:10];
        [cell2 mutate:40];

        NSLog(@"%@", cell1);
        NSLog(@"%@", cell2);
        NSLog(@"Hamming distance: %i", [cell1 hammingDistance:cell2]);
    }
    return 0;
}

