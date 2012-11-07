//
//  Cell+Mutator.m
//  osx-project-1
//
//  Created by sergeich on 07.11.12.
//  Copyright (c) 2012 sergeich. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void)mutate:(int)percentToChange {
    NSMutableSet *changedIndices = [[NSMutableSet alloc] init];
    NSUInteger const genesLength = [[self genes] count];
    NSUInteger const DNALength = [[self DNA] count];
    NSUInteger const countToChange = DNALength * ((float) percentToChange / 100);
    
    for (int i = 0; i < countToChange; i++) {
        int indexToChange;
        do {
            indexToChange = arc4random() % DNALength;
        } while ([changedIndices containsObject:[NSNumber numberWithInt:indexToChange]]);
        [changedIndices addObject:[NSNumber numberWithInt:indexToChange]];
        
        id oldValue = [[self DNA] objectAtIndex:indexToChange];
        id newValue;
        do {
            newValue = [[self genes] objectAtIndex:arc4random() % genesLength];
        } while ([newValue isEqual:oldValue]);
        
        [[self DNA] setObject:newValue atIndexedSubscript:indexToChange];
    }
}

@end
