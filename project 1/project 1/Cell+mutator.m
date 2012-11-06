//
//  Cell+mutator.m
//  project 1
//
//  Created by Dmitriy Zhukov on 11/6/12.
//  Copyright (c) 2012 Dmitriy Zhukov. All rights reserved.
//

#import "Cell+mutator.h"


@implementation Cell (mutator)

- (void)mutate:(int)mutationPercentages
{
    NSMutableArray *mutatedGenes = [NSMutableArray array];
    
    NSUInteger mutatedGenesCount = [self->DNA count] * mutationPercentages / 100;
    
    for (NSUInteger i = 0; i < mutatedGenesCount; i++)
    {
        NSNumber *index;
        do
        {
            index = [NSNumber numberWithInt:rand() % 100];
        }
        while ([mutatedGenes containsObject:index]);
        
        [mutatedGenes addObject:index];
        
        [self->DNA replaceObjectAtIndex:[index unsignedIntegerValue]
                             withObject:[Cell randomGene]];
    }
}

@end
