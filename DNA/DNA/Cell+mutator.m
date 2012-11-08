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
    if (percentages <= 0 || percentages > 100) {
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:@"Percentages value must be in range (0..100]"
                                     userInfo:nil];
    }
    
    NSMutableArray *replacedIndices = [NSMutableArray array];
    NSUInteger DNACount = [self->DNA count];
    NSUInteger iteratesCount = percentages * DNACount / 100.0;
    
    for (NSUInteger i = 0; i < iteratesCount; i++) {
        NSNumber *index;
        do {
            index = [NSNumber numberWithInt:rand() % DNACount];
        } while ([replacedIndices containsObject:index]);
        [replacedIndices addObject:index];
        
        NSString *oldChar = [self->DNA objectAtIndex:[index unsignedIntegerValue]];
        NSString *newChar;
        do {
            newChar = [[self class] randomChar];
        } while ([newChar isEqualToString:oldChar]);
        [self->DNA replaceObjectAtIndex:[index unsignedIntegerValue]
                             withObject:newChar];
    }
}

@end
