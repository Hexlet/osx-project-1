//
//  Cell+Mutator.m
//  DNATest
//
//  Created by Aliaksandr Słaŭščyk on 01.11.12.
//  Copyright (c) 2012 Aliaksandr Słaŭščyk. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void) mutate: (int) perc
{
    NSMutableSet* ids = [[NSMutableSet alloc] init];
    int i;
    for (i = 0; i < [self.DNA count]; i++) {
        [ids addObject:[NSNumber numberWithInt:i]];
    }
    i = 1;
    while (i < floor([self.DNA count] * perc * 0.01)) {
        id obj = [ids anyObject];
        int idx = [obj intValue];
        [self replaceKeyAtIndex:idx];
        [ids removeObject:obj];
        i++;
    }
}
- (void) replaceKeyAtIndex: (int) idx
{
    NSString *elem = [self.DNA objectAtIndex:idx];
    NSMutableArray *newValues = [self.DNA mutableCopy];
    [newValues removeObject:elem];
    [self.DNA setObject:[newValues objectAtIndex:arc4random() % [newValues count]] atIndexedSubscript:idx];
}
@end
