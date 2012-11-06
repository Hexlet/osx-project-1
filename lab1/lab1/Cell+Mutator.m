//
//  Cell+Mutator.m
//  lab1
//
//  Created by diana shumskaya on 11/3/12.
//  Copyright (c) 2012 diana shumskaya. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void) mutate:(int)percentMutate {
    
    NSMutableArray* indexes = [NSMutableArray array];
   
    for (int i=0; i<kDnaLenght;i++) {
       [indexes addObject:[NSNumber numberWithInt:i]];
    }
    
    for (int i=1; i <= percentMutate;i++) {
        
        int index = arc4random()% [indexes count];
        int value = [[indexes objectAtIndex:index] intValue];
        [indexes removeObjectAtIndex:index];
        [self.dnaItems replaceObjectAtIndex:value withObject:[[self.dnaSymbols allObjects] objectAtIndex:arc4random()%[self.dnaSymbols count]]];
    }
}

@end
