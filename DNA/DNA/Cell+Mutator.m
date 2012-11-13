//
//  Cell+Mutator.m
//  DNA
//
//  Created by Foboz on 13.11.12.
//  Copyright (c) 2012 Foboz. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)
- (void) mutate:(int)percents
{
    percents = MIN(MAX(percents, 0), 100);
    int dnaLength = (int)[self.DNA count];
    NSUInteger elementsCount = dnaLength / 100 * percents;
    if (elementsCount > 0) {
        NSMutableSet *uniquesElements = [[NSMutableSet alloc] initWithCapacity:elementsCount];
        NSUInteger affected = 0;
        NSUInteger randomPosition;
        NSArray *symbols = [Cell getSymbols];
        int symbolsCount = (int)[symbols count];
        NSString *randomSymbol;
        NSString *currentSymbol;
        while (affected != elementsCount) {
            do {
                randomPosition = arc4random_uniform(dnaLength);
            } while ([uniquesElements containsObject:@(randomPosition)]);
            [uniquesElements addObject:@(randomPosition)];
            currentSymbol = [self.DNA objectAtIndex:randomPosition];
            do {
                randomSymbol = [symbols objectAtIndex:arc4random_uniform(symbolsCount)];
            } while ([randomSymbol isEqualToString:currentSymbol]);
            [self.DNA replaceObjectAtIndex:randomPosition withObject:randomSymbol];
            ++affected;
        }
    }
}
@end
