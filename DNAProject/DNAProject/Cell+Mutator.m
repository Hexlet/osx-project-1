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
    int counter = 0;
    NSNumber *randIndex;
    while (counter < howPercent) {
        randIndex = [NSNumber numberWithInt:arc4random()% 4];
        if (![_mutatedElements containsObject: randIndex]) {
           [_mutatedElements addObject:randIndex];
           [_DNA insertObject:[self generateElement] atIndex: counter];
            counter++;
        }
    }
}

@end
