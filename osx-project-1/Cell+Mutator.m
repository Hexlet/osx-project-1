//
//  Cell+Mutator.m
//  osx-project-1
//
//  Created by Alexandr on 11/6/12.
//  Copyright (c) 2012 Alexandr. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void)mutate:(int)mutatePercent {
    if (mutatePercent < 0 || mutatePercent > 100) {
        NSLog(@"Incorrect mutate percent");
        return;
    }
    
    int positionCount = ceil(self.DNA.count * mutatePercent / 100);
    NSRange rangeToRemove = {.location = self.DNA.count - positionCount - 1, .length = positionCount};
    
    NSMutableArray *indexes = [self generateIndexes];
    [self shuffleArray:indexes];
    [indexes removeObjectsInRange:rangeToRemove];
    
    [self fillRandomAtPositions:indexes];
}

- (void)shuffleArray:(NSMutableArray *)array {
    uint count = (uint)[array count];
    for (uint i = 0; i < count; i++) {
        int n = arc4random_uniform(count - i) + i;
        [array exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end
