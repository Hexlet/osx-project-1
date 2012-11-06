//
//  Cell+mutator.m
//  DNA
//
//  Created by Roman Zhovnirchyk on 2012-11-04.
//  Copyright (c) 2012 Roman Zhovnirchyk. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void) mutate: (int) percent {
    
    if (percent < 0 || percent > 100) {
        return;
    }
    
    // number of DNA values to mutate
    int elements = percent * dnaCapacity / 100;
    
    // initialize an array of mutated values
    NSMutableArray *mutatedElements = [[NSMutableArray alloc] initWithCapacity:elements];
    NSString *newValue = [[NSString alloc] init];
    NSString *currentValue = [[NSString alloc] init];
    
    int i = 0;
    while (i < elements) {
        
        // get random index of DNA value to mutate
        int indexToMutate = (arc4random() % dnaCapacity);
        
        // check if the element was already mutated
        if ([mutatedElements containsObject:[NSNumber numberWithInt:indexToMutate]]) {
            
            continue;
            
        } else {
            
            // generate random new value
            newValue = [self.possibleDnaValues objectAtIndex:(arc4random() % [self.possibleDnaValues count])];
            
            // get currect value
            currentValue = [self.dna objectAtIndex:indexToMutate];
            
            // replace the value if the new value is not the same as current
            if (newValue != currentValue) {
                
                [self.dna replaceObjectAtIndex:indexToMutate withObject:newValue];
                
                // add position of mutated value to mutatedElements array
                [mutatedElements addObject:[NSNumber numberWithInt:indexToMutate]];
                
            }
        }
        
        i++;
    }
    
}

@end
