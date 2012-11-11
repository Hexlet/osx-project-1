//
//  cell+mutator.h
//  DNAProject
//
//  Created by VITALIY NESTERENKO on 11.11.12.
//  Copyright (c) 2012 VITALIY NESTERENKO. All rights reserved.
//

#ifndef DNAProject_cell_mutator_h
#define DNAProject_cell_mutator_h

#import "cell.h"

@interface Cell (mutator)
@end


@implementation Cell (mutator)

- (void) mutate:(int)percent {
    
    int positions_to_change_count = (int)((100 * percent) / 100);
    int positions[positions_to_change_count];
    
    NSString *current_nucleotide;
    NSString *mutated_nucleotide;
   
   
    
    [self fillArrayWithRandomSequence:0 to:99 count:positions_to_change_count sequnce:positions];
    
    for (int i = 0; i < positions_to_change_count; i++) {
        
        current_nucleotide = [_DNA objectAtIndex:positions[i]];
        
        while ([current_nucleotide isEqualToString: (mutated_nucleotide = [self randomNucleotide]) ] ) {
            mutated_nucleotide = [self randomNucleotide];
        }
        
       [_DNA replaceObjectAtIndex:positions[i] withObject: mutated_nucleotide];
        
    }
    
    
}

@end

#endif
