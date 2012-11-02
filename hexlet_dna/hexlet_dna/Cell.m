//
//  Cell.m
//  hexlet_dna
//
//  Created by Alexander Shvets on 02.11.12.
//  Copyright (c) 2012 Alexander Shvets. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init {
    self = [super init];
    
    if(self){
        _dna = [NSMutableArray arrayWithCapacity:100];
        _nucleotides = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        
        for(int i = 0; i < 100; i++){
            int nucleotideIndex = arc4random() % 4;
            
            [_dna insertObject:[_nucleotides objectAtIndex:nucleotideIndex] atIndex:i];
            
         }
        
    }

    return self;
}

- (int) hammingDistance: (Cell*)cell {
    int distance = 0;
    
    for(int i = 0; i < [cell.dna count]; i++){
        if(![[cell.dna objectAtIndex:i] isEqual:[self.dna objectAtIndex:i]]) distance++;
    }
    
    return distance;
}
@end
