//
//  Cell+mutator.m
//  DNA
//
//  Created by Anatoliy Dudarchuk on 01.11.12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

- (void)mutate:(int)percentages
{
    NSMutableArray *replacedIndices = [NSMutableArray array];

    for (NSUInteger i = 0; i < percentages; i++) {
        NSNumber *index;
        do {
            index = [NSNumber numberWithInt:rand() % 100];
        } while ([replacedIndices containsObject:index]);
        
        [self->DNA replaceObjectAtIndex:[index unsignedIntegerValue]
                             withObject:[[self class] randomChar]];
    }
}

@end
