//
//  Cell+Mutator.m
//  DNA
//
//  Created by xxsnakerxx on 30.10.12.
//  Copyright (c) 2012 xxsnakerxx. All rights reserved.
//

#import "Cell+Mutator.h"
#import "Cell.h"

@implementation Cell (Mutator)

- (void)mutate:(int)percents
{
    NSUInteger counter;
    NSUInteger dnaCount = [self.DNA count];
    NSUInteger dnaKeysCount = [self.dnaKeys count];
    NSUInteger randInsertIndex;
    NSUInteger randKeyIndex;
    
    NSMutableIndexSet *indexes = [NSMutableIndexSet indexSet];
    
    for (counter = 0; counter < percents; counter++) {
        
        randKeyIndex = (NSUInteger)(arc4random() % dnaKeysCount);
        randInsertIndex = (NSUInteger)(arc4random() % dnaCount);
        
        while ([indexes containsIndex:randInsertIndex]) {
            randInsertIndex = (NSUInteger)(arc4random() % dnaCount);
        }
        
        while ([[self.DNA objectAtIndex:randInsertIndex] isEqual:[self.dnaKeys objectAtIndex:randKeyIndex]]) {
            randKeyIndex = (NSUInteger)(arc4random() % dnaKeysCount);
        }

        [self.DNA replaceObjectAtIndex:randInsertIndex
                            withObject:[self.dnaKeys objectAtIndex:randKeyIndex]];
        
        [indexes addIndex:randInsertIndex];
        
        NSLog(@"%ld", randInsertIndex);
    };
    
    NSLog(@"\n");
}

@end
