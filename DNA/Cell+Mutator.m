//
//  Cell+Mutator.m
//  DNA
//
//  Created by Vlad on 03.11.12.
//  Copyright (c) 2012 Vlad. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate:(int)mutationPercent
{
    NSAssert(mutationPercent > 0, @"The mutation percet should be greater then zero");
    NSAssert(mutationPercent <= 100, @"The mutation percet should be less then one hundred");
    
    int numberOfChangedElements = (((float)[[self DNA] count]) / 100) * mutationPercent;
    // Generate indexes of elements which sould be changed
    NSMutableSet *setOfMutatedIndexes = [[NSMutableSet alloc] init];
    do {
        // Generate numbers form 0 to 99
        // arc4random_uniform(max - min + 1) + min
        NSUInteger maxIndex = NUMBER_OF_ELEMENTS - 1;
        NSUInteger minIndex = 0;
        NSUInteger randomlyGeneratedMutatedIndex = arc4random_uniform((int)maxIndex - (int)minIndex + 1) + minIndex;
        [setOfMutatedIndexes addObject:[NSNumber numberWithInteger:randomlyGeneratedMutatedIndex]];
    } while ([setOfMutatedIndexes count] < numberOfChangedElements);
    
    // Set new generated values by found on the previous step indexes
    for(NSNumber *mutatedIndex in setOfMutatedIndexes)
    {
        NSString *oldGen = [[self DNA] objectAtIndex:[mutatedIndex integerValue]];
        NSString *newlyGeneratedGen = [[NSString alloc] init];
        
        // Radomly generate a new value of DNA chain,
        // if the new value equals the old value, then repeat and regenerate
        do {
            newlyGeneratedGen = [self generateRandomGen];
        } while ( oldGen == newlyGeneratedGen );

        [[self DNA] replaceObjectAtIndex:[mutatedIndex integerValue] withObject:newlyGeneratedGen];
    } //for
}

@end
