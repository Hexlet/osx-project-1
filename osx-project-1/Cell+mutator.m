//
//  Cell+mutator.m
//  osx-project-1
//
//  Created by Pavel Nikitin on 11/2/12.
//  Copyright (c) 2012 Pavel Nikitin. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void) mutate:(int)mutateFactor {
    // create mutated zombie as a copy of self
    Cell *zombie = [[Cell alloc] initWithDNA: [self DNA]];
    
//    By the way this is not better implementation cause if we provide
//    mutatateFactor closest to 100 then we can make 1*E6 iterations
//    to get by random generator unused index
//
//    do {
//        NSUInteger randIndex;
//        NSArray *usedIndecies = @[];
//        
//        // generate random index until found unchanged
//        do {
//            randIndex = arc4random() % [[self DNA] count];
//        } while ([usedIndecies containsObject:[NSNumber numberWithInteger:randIndex]]);
//
//        NSString *randFromRange = [[self range] randomButNot:[[self DNA] objectAtIndex:randIndex]];
//        
//        [[zombie DNA] replaceObjectAtIndex:randIndex withObject:randFromRange];
//    } while ([self hammingDistance:zombie] != mutateFactor);
    
    // this should work faster
    NSMutableArray *DNAIndecies = [NSMutableArray array];
    for (int i=0; i<100; i++) {
        [DNAIndecies addObject: [NSNumber numberWithInt: i]];
    }
    
    do {
        NSNumber *randIndex = [DNAIndecies objectAtIndex: arc4random() % [DNAIndecies count]];
        NSString *randFromRange = [[self range] randomButNot:[[self DNA] objectAtIndex:[randIndex intValue]]];

        [[zombie DNA] replaceObjectAtIndex:[randIndex intValue]withObject:randFromRange];
        
        [DNAIndecies removeObject:randIndex];
    } while ([self hammingDistance:zombie] != mutateFactor);
    
    // get zombie`s DNA
    [self setDNA:[zombie DNA]];
}

@end
