//
//  Cell.m
//  DNA
//
//  Created by Ihor Bodnar on 11/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell 

@synthesize dna, aAvailableSymbols;

-(id) init {
    if (self = [super init]) {
        
        aAvailableSymbols = [NSArray arrayWithObjects: @"A", @"T", @"G" ,@"C", nil];
        
        dna = [NSMutableArray arrayWithCapacity: (100)];

        for (int i = 0; i < 100; i++) {
            [dna insertObject:[aAvailableSymbols objectAtIndex:(arc4random()%4)] atIndex:i];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)cell {
    int cntDiff = 0;
    int i;
    
    for (i = 0; i < [self.dna count]; i++) {
        if ([self.dna objectAtIndex:(i)] != [cell.dna objectAtIndex:(i)]) {
            cntDiff++;
        }
    }
    return cntDiff;
}

@end
