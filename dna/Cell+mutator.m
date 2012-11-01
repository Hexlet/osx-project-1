//
//  Cell+mutator.m
//  dna
//
//  Created by Konstantin Tumalevich on 01.11.12.
//  Copyright (c) 2012 Konstantin Tumalevich. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
- (void) mutate:(int)percent {
    NSMutableArray *changed_indexes = [NSMutableArray new];
    int changed_indexes_count = 0;
    int random_number;
    while (changed_indexes_count < percent) {
        random_number = arc4random() % [self.dna count];
        if (![changed_indexes containsObject:[NSNumber numberWithInt:random_number]]) {
            [changed_indexes addObject:[NSNumber numberWithInt:random_number]];
            changed_indexes_count++;
            [self.dna replaceObjectAtIndex:random_number withObject:[self getCode:[self.dna objectAtIndex:random_number]]];
        }
    }
}
@end
