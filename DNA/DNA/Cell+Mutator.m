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
    // Calculate the number of mutated cells
    amount = (int)round((CELL_SIZE / 100.0f) * n);
    
    // Set of indices to mutate
    NSMutableSet* mutate_indices = [[NSMutableSet alloc] initWithCapacity:amount];
    
    // Fill in the mutate_indices with unique random indices
    while ([mutate_indices count] < amount)
        [mutate_indices addObject:[NSNumber numberWithInt:arc4random_uniform(CELL_SIZE)]];
    
    // Replace elements in DNA at "mutate" indices
    for (NSNumber* num in mutate_indices) {
        NSString* new_element = [self generateNewElement];
        
        // Generate new random element if the old element equals the new one 
        while ([[[self DNA] objectAtIndex:[num intValue]] isEqual: new_element])
            new_element = [self generateNewElement];
        
        [self.DNA replaceObjectAtIndex:[num intValue] withObject:new_element];
    }
}

@end
