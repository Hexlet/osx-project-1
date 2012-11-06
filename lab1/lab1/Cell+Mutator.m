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
    
    NSLog(@"start mutate with percent %d", percentMutate);
    
    NSMutableArray* indexes = [NSMutableArray array];
   
    for (int i=0; i<kDnaLenght;i++) {
       [indexes addObject:[NSNumber numberWithInt:i]];
    }
    
    int newIndex;
    int newIndexValue;
    int incReplace = 0;
    int incAll = 0;
    BOOL cellEqual = NO;
    NSString *newValue = nil;
    NSString *oldValue = nil;
    
    for (int i=1; i <= percentMutate;i++) {
        
        cellEqual = NO;
        incAll ++;
        
        while (!cellEqual) {
            
            newIndex = arc4random()% [indexes count];
            newIndexValue = [[indexes objectAtIndex:newIndex] intValue];
            
            newValue = [[self.dnaSymbols allObjects] objectAtIndex:arc4random()%[self.dnaSymbols count]];
            oldValue = [self.dnaItems objectAtIndex:newIndexValue];
            
            if (![newValue isEqualToString:oldValue]) {
                cellEqual = YES;
            } 
        }
        
        if (cellEqual) {
            [indexes removeObjectAtIndex:newIndex];
            [self.dnaItems replaceObjectAtIndex:newIndexValue withObject:newValue];
            incReplace ++;
            NSLog(@"mutate %@ %@",newValue, oldValue);
        }
        
    }
    
    NSLog(@"end mutate: %d of %d mutated",incAll, incReplace);
}

@end
