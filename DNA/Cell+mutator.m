//
//  Cell+mutator.m
//  DNA
//
//  Created by Dm on 11/3/12.
//  Copyright (c) 2012 Dm. All rights reserved.
//

#import "Cell+mutator.h"
#import "NSMutableArray+Shuffling.h"

@implementation Cell (mutator)
-(void) mutate:(int)viruses {
    
    NSMutableArray *viruseBase = [[NSMutableArray alloc] init];
    
    //fill viruseBase
    for (int i = 0; i < viruses; i++) {
        NSNumber *virusNumber = [[NSNumber alloc] initWithInteger:i];
        [viruseBase addObject:virusNumber];
    }
    //shuffle viruseBase
    [viruseBase shuffle];
    
    for (int i = 0; i < [viruseBase count]; i++) {
        [
         [self dna]
         replaceObjectAtIndex:[[viruseBase objectAtIndex:i] intValue]
         withObject:[[self nucleobase] objectAtIndex:arc4random() % [[self nucleobase] count]]
         ];
    }
    
}
@end
