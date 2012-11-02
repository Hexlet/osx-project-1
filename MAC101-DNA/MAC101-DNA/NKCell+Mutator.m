//
//  NKCell+Mutator.m
//  MAC101-DNA
//
//  Created by Nikita Korchagin on 01.11.12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import "NKCell+Mutator.h"
#import "NKDNASymbol.h"
#include <stdlib.h>

@implementation NKCell (Mutator)

- (void)mutatePercentOfSymbols:(NSUInteger)percentOfSymbols
{
    u_int32_t totalIndexesCount = (u_int32_t)[self.DNA count];
    NSUInteger numberOfIndexesToMutate = totalIndexesCount*percentOfSymbols/100;
    
    NSMutableIndexSet *indexesToMutate = [NSMutableIndexSet indexSet];
    while ([indexesToMutate count] < numberOfIndexesToMutate) {
        NSUInteger randomIndex = arc4random_uniform(totalIndexesCount);
        if (![indexesToMutate containsIndex:randomIndex]) {
            [indexesToMutate addIndex:randomIndex];
        }
    }
    
    [indexesToMutate enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        NKDNASymbol *symbolToMutate = [self.DNA objectAtIndex:idx];
        [symbolToMutate mutate];
    }];
}

@end
