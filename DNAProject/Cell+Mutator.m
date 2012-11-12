//
//  Cell+Mutator.m
//  DNAProject
//
//  Created by Olga Andreyeva on 11/4/12.
//  Copyright (c) 2012 Olga Andreyeva. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void) mutate:(int)x {
    
    if (x<0 || x>100)
        [NSException raise:@"X should be between 0 and 100" format:@"x of %d is invalid", x];
    
    NSMutableArray* indexes = [NSMutableArray arrayWithCapacity:self.DNALength];
    
    for (NSInteger i = 0; i<self.DNALength; i++) {
        [indexes addObject:[NSNumber numberWithInteger:i]];
    }
    
    for (int i = 0; i<x; i++) {
        int randomIndex = arc4random()%indexes.count;
        int randomSymbolIndex = arc4random()%self.symbols.count;
        while (self.DNA[[indexes[randomIndex] intValue]] == self.symbols[randomSymbolIndex]) {
            randomSymbolIndex = arc4random()%self.symbols.count;
        }
        self.DNA[[indexes[randomIndex] intValue]] = self.symbols[randomSymbolIndex];
        
        [indexes removeObjectAtIndex:randomIndex];
    }
}

@end
