//
//  Cell+Mutator.m
//  Project_1
//
//  Created by Arseniy Gushin on 04.11.12.
//  Copyright (c) 2012 Arseniy Gushin. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void)mutate:(int)mutatePercentage
{
    // array to keep mutated genome
    NSMutableArray *mutatingGenome = [self.DNA mutableCopy];
    
    // items count to mutate
    NSInteger mutateCount = round(mutatingGenome.count * (mutatePercentage / 100.0f));

    // mutating symbol index
    NSInteger symbolIndex = 0;
    
    // string to keep intial value for mutating symbol
    NSString *originalSymbol = nil;

    // string to hold the new, mutated symbol
    NSString *mutatedSymbol = nil;
    
    // array to keep mutated symbols
    // to prevent multiple mutations
    NSMutableArray *mutatedSymbolsIndexes = [NSMutableArray array];
    
    for (int i = 0; i < mutateCount; i++)
    {
        while (1)
        {
            // weird way to convert 'unsigned long' to 'int'
            int a = [NSNumber numberWithUnsignedInt:mutatingGenome.count].intValue;
            // get random symbol index
            symbolIndex = [Cell randomInRangeLo:0 toHi:a-1];
            // check if it was mutated before
            if (![mutatedSymbolsIndexes containsObject:[NSNumber numberWithInteger:symbolIndex]]) break;
        }
        // save the original symbol
        // to check that mutation did take place
        originalSymbol = [mutatingGenome objectAtIndex:symbolIndex];
        // mutate the symbol until it gets new value
        mutatedSymbol = [self randomDNASymbol];
        while ([originalSymbol isEqualToString:mutatedSymbol])
        {
            // MUTATE!
            mutatedSymbol = [self randomDNASymbol];
        }
        // save the symbol
        [mutatingGenome setObject:mutatedSymbol atIndexedSubscript:symbolIndex];
        // add symbol index to the list of mutated
        [mutatedSymbolsIndexes addObject:[NSNumber numberWithInteger:symbolIndex]];
    }
    self.DNA = mutatingGenome;
}

@end
