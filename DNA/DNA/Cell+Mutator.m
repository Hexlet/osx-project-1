//
//  Cell+Mutator.m
//  DNA
//
//  Created by Yaroslav Shukharev on 01.11.12.
//  Copyright (c) 2012 krkmetal. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate: (int) n {
    int amount;
    // Calculate the number of mutated cell
    amount = (int)round((CELL_SIZE / 100.0f) * n);
    
    // Set of indices to mutate
    NSMutableSet *mutate_indices = [[NSMutableSet alloc] init];
    
    // Fill in the mutate_indices with unique random indices
    while ([mutate_indices count] < amount) {
        // Wrap up an integer into NSNumber object to add it to the mu
        NSNumber *random_index = [[NSNumber alloc] initWithInt:arc4random_uniform(CELL_SIZE)];
        [mutate_indices addObject:random_index];
    }
    
    // Create an enumerator to iterate through the whole set of indices
    NSEnumerator *enumerator = [mutate_indices objectEnumerator];
    id value;
    
    NSArray *elements_dna = [[NSArray alloc] initWithObjects:@"A", @"G", @"T", @"C", nil];
    
    while ((value = [enumerator nextObject])) {
        [self.DNA replaceObjectAtIndex:[value intValue] withObject:[elements_dna objectAtIndex:arc4random_uniform(4)]];
    }
}

@end
