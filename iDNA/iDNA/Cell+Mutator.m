//
//  Cell+Mutator.m
//  iDNA
//
//  Created by Darwin on 02.11.12.
//  Copyright (c) 2012 Ivo Dimitrov. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void)mutate:(int)percent {
    if (percent < 0 && percent > 100) {
        NSLog(@"Error percent. 0 to 100");
        return;
    }
    
    NSMutableArray *mutateSymbols = [NSMutableArray array];
    NSUInteger mutateCount = [self.DNA count] * percent / 100;
    
    for (NSUInteger i = 0;  i < mutateCount; i++) {
        NSNumber *index;
        
        do {
            index = [NSNumber numberWithInt:rand() % 100];
        } while ([mutateSymbols containsObject:index]);
        
        [mutateSymbols addObject:index];
        
        [self.DNA replaceObjectAtIndex:[index unsignedIntegerValue] withObject:[Cell getRandomDNA]];
    }
}

@end