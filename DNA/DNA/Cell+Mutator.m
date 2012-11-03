//
//  Cell+Mutator.m
//  DNA
//
//  Created by Cyxx on 03.11.12.
//  Copyright (c) 2012 Cyxx. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void)mutate:(int)percent {
    // clip percent to range [0, 100]
    percent = MAX(0, MIN(percent, 100));
    
    NSMutableOrderedSet *set = [NSMutableOrderedSet orderedSet];
    for (int i = 0; i < DNA_COUNT; i++)
        [set addObject:[NSNumber numberWithInt:i]];
    
    int mutationsCount = DNA_COUNT*percent/100;
    for (int i = 0; i < mutationsCount; i++) {
        NSUInteger indexInSet = (arc4random() % set.count);
        NSUInteger indexInDNA = [(NSNumber*)[set objectAtIndex:indexInSet] intValue];
        
        NSUInteger elementIndex = [[Cell elements] indexOfObjectIdenticalTo: [dna objectAtIndex:indexInDNA]];
        NSUInteger mutatedElementIndex = (elementIndex + 1 + arc4random()%([[Cell elements] count] - 1))%[[Cell elements] count];
        [dna replaceObjectAtIndex:indexInDNA withObject:[[Cell elements] objectAtIndex:mutatedElementIndex]];
        [set removeObjectAtIndex:indexInSet];
    }
}

@end
