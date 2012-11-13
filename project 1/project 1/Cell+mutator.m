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
    if (mutationPercentages < 0 || mutationPercentages > 100)
    {
        NSLog(@"Error: Mutation percentage must be in range 0 to 100.");
        return;
    }
    
    NSMutableArray *mutatedGenes = [NSMutableArray array];
    
    NSUInteger mutatedGenesCount = [self->DNA count] * mutationPercentages / 100;
    
    for (NSUInteger i = 0; i < mutatedGenesCount; i++)
    {
        NSNumber *index;
        NSString *newGene;
        do
        {
            index = [NSNumber numberWithInt:rand() % 100];
            newGene = [Cell randomGene];
        }
        while ([mutatedGenes containsObject:index] || [[self->DNA objectAtIndex:[index unsignedIntegerValue]] isEqualToString:newGene]);
        
        [mutatedGenes addObject:index];
        [self->DNA replaceObjectAtIndex:[index unsignedIntegerValue]
                             withObject:newGene];
    }
}

@end
