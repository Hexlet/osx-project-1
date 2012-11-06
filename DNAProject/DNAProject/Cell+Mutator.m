//
//  Cell+Mutator.m
//  DNAProject
//
//  Created by Valery Kharshats on 11/4/12.
//  Copyright (c) 2012 Valery Kharshats. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)


-(void) mutate: (int) howPercent {
    NSUInteger elementsToMutate = (CELL_LENGTH / 100) * howPercent;
    NSMutableArray *mutatorIndexes = [NSMutableArray arrayWithCapacity:elementsToMutate];
    for (NSInteger i = 0; i < elementsToMutate; i++) {   //TODO: Need implementation of shuffle function
        [mutatorIndexes addObject:[NSNumber numberWithInteger:i]];
    }
    for (int i = 0; i < elementsToMutate; i++) {
        [_DNA replaceObjectAtIndex:i withObject:[self generateElement]];
    }
}

@end
