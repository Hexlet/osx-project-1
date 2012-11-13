//
//  Cell+mutator.m
//  DNA
//
//  Created by Akki on 11/10/12.
//  Copyright (c) 2012 Akki. All rights reserved.
//

#import "Cell+mutator.h"

//static NSMutableArray *mutationBuffer;

@implementation Cell (mutator)

- (void)mutate:(int)mutation_factor
{
    NSMutableArray *indexes = [NSMutableArray arrayWithCapacity:self.DNA.count];
    for (int ind = 0; ind < self.DNA.count; ind++)
        [indexes addObject:[NSNumber numberWithInt:ind]];
    
    for (int i = 0; i < mutation_factor; i++) {
        int random_nucleotide_index = arc4random() & 3;
        NSString *random_nucleotide = [self.nucleotides objectAtIndex:random_nucleotide_index];
        
        int random_index = arc4random() & indexes.count-1;
        [self.DNA replaceObjectAtIndex:random_index withObject:random_nucleotide];
        [indexes removeObjectAtIndex:random_index];
    }
}
@end
