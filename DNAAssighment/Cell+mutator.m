//
//  Cell+mutator.m
//  DNAAssighment
//
//  Created by Oleg Langer on 30.10.12.
//  Copyright (c) 2012 Oleg Langer. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

- (void) mutate:(int)percent {
    NSAssert(percent <= 100 && percent > 0, @"percentage outside the boundaries 0 till 100");
    int X = SIZE_OF_DNA_ARRAY * percent / 100;
    NSMutableArray *replacedPositions = [NSMutableArray arrayWithCapacity:X];
    int randNumber;
    NSString *replaceSymbol = nil;
    for (int i = 0; i < X; i ++) {
        randNumber = arc4random() % SIZE_OF_DNA_ARRAY;
        if ([replacedPositions containsObject:@(randNumber)]) {
            i--;
            continue;
        }
        do {
            replaceSymbol = [self randomSymbol];
        } while ([self.dna[randNumber] isEqualToString:replaceSymbol]);
        [self.dna replaceObjectAtIndex:randNumber withObject:replaceSymbol];
        [replacedPositions addObject:@(randNumber)];
    }
}

@end
