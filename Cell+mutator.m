//
//  Cell+mutator.m
//  DNAAssighment
//
//  Created by Oleg Langer on 30.10.12.
//  Copyright (c) 2012 Oleg Langer. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

- (void) mutate:(int)X {
    // x percent of 100 = x
    NSMutableArray *replacedPositions = [NSMutableArray arrayWithCapacity:X];
    while (X--) {
        int randNumber = arc4random() % 100;
        if ([replacedPositions containsObject:@(randNumber)]) {
            X++;
            continue;
        }
        [self.DNA replaceObjectAtIndex:randNumber withObject:[self randomSymbol]];
        [replacedPositions addObject:@(randNumber)];
    }
}

@end
