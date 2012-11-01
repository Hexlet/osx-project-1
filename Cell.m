//
//  Cell.m
//  project1_DNA
//
//  Created by Alex on 11/1/12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    
    if(self){
        fillChars = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
        
        _DNA = [[NSMutableArray alloc] initWithCapacity:(CELL_CAPACITY)];
        
        for (int i=0; i < CELL_CAPACITY; i++) {
            [_DNA insertObject:[fillChars objectAtIndex: arc4random() % [fillChars count]] atIndex:i];
        }
    }
    
    return self;
}

-(int) hammingDistance: (Cell*) cell {
    int distance = 0;
    for (int i=0; i < CELL_CAPACITY; i++) {
        if(![[self.DNA objectAtIndex:i] isEqual:[cell.DNA objectAtIndex:i]]){
            distance++;
        }
    }
    return distance;
}

@end
