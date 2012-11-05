//
//  Cell+Mutator.m
//  project1-dna
//
//  Created by DaZzz on 05.11.12.
//  Copyright (c) 2012 DaZzz. All rights reserved.
//

#import "Cell+Mutator.h"

// Mutator category
@implementation Cell (Mutator)

- (void) mutate: (int)percentage {
    // assert percentage in [0, 100]
    if (percentage > 100 || percentage < 0)
        [NSException raise:@"Invalid percentage value" format:@"percentage of %d is not in range from 0 to 100", percentage];
    
    // getting array of distinct indexes
    NSMutableArray * indexes = [[NSMutableArray alloc] initWithCapacity:100];
    for (int i = 0; i < CELL_SIZE; ++i)
        [indexes addObject: [NSNumber numberWithInt:i]];
    [indexes shuffle];
    
    // count of elements that we need to change (usefull if CELL_SIZE != 100)
    int countOfMutations = round((CELL_SIZE / 100.0) * percentage);
    
    for (int i = 0; i < countOfMutations; ++i) {
        // get random index
        int indexToChange = (int)[[indexes objectAtIndex: i] integerValue];
        
        // Calculating new symbol
        NSString *oldSymbol = [[self DNA] objectAtIndex: indexToChange];
        NSString *newSymbol = [[self symbols] objectAtIndex: ([[self symbols] indexOfObject: oldSymbol] + arc4random_uniform(3)) % 4];
        
        // change symbol on the given random position
        [self.DNA replaceObjectAtIndex: i withObject: newSymbol];
    }
}

@end