//
//  Cell_Mutator.m
//  prj1-DNA
//
//  Created by void on 12.11.12.
//  Copyright (c) 2012 void. All rights reserved.
//

#import "Cell_Mutator.h"

@implementation Cell (Mutator)

- (void)mutate:(int) mPerc {
    if (mPerc < 0 || mPerc > 100) {
        NSLog(@"Incorrect mutate percent");
        return;
    }
    
    int posCount = ceil(self.DNA.count * mPerc / 100);
    NSRange toErase = {.location = self.DNA.count - posCount - 1, .length = posCount};
    
    NSMutableArray *ind = [self crInd];
    [self mixArray:ind];
    [ind removeObjectsInRange:toErase];
    
    [self filling:ind];
}

- (void)mixArray:(NSMutableArray *)inArray {
    uint count = (uint)[inArray count];
    for (uint i = 0; i < count; i++) {
        int n = arc4random_uniform(count - i) + i;
        [inArray exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end