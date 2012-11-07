//
//  Cell+mutator.m
//  DNA
//
//  Created by Ihor Bodnar on 11/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
-(void) mutate:(int)percentSymbols {
    int dnaSize = (int)[self.DNA count];
    int cntSymbols = (int)round(dnaSize * percentSymbols / 100);
    NSMutableArray *indexes;
    
    // initialize indexes array
    indexes = [[NSMutableArray alloc] init];
    for (int i = 0; i < dnaSize; i++) {
        [indexes insertObject:[NSNumber numberWithInt:i] atIndex:i];
    }
    
    // shuffle indexes array
    for (int i = 0; i < dnaSize; i++) {
        [indexes exchangeObjectAtIndex:i withObjectAtIndex:arc4random()%dnaSize];        
    }
    
    // mutate first <cntSymbols> elements
    for (int i = 0; i < cntSymbols; i++) {
        int idx = [[indexes objectAtIndex:i] intValue];
        [self.DNA replaceObjectAtIndex:idx withObject:([Cell getRandomCode:[self.DNA objectAtIndex:idx]])];
    }
}
@end
