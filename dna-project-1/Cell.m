//
//  Cell.m
//  dna-project-1
//
//  Created by Apple on 11/3/12.
//  Copyright (c) 2012 Alexander Gedranovich. All rights reserved.
//

#import "Cell.h"

@implementation Cell

// Initializing...
-(id) init{
    self = [super init];
    if(self){
        _size = 100;
        _genes = @"ATGC";
        _DNA = [[NSMutableArray alloc] initWithCapacity:_size];
        
        // Initializes <DNA> with random values from <genes>
        // arc4random() returns 'TRUE' random integer
        for(int i=0; i<_size; i++){
            int index = arc4random() % [_genes length];
            [_DNA addObject:[_genes substringWithRange:NSMakeRange(index, 1)]];
        }
    }
    return self;
}

// Returns a number of unmatched genes in self and cell
-(int) hammingDistance:(Cell*) cell{
    int result = 0;
    for(int i=0; i<_size; i++){
        if([[_DNA objectAtIndex:i] isNotEqualTo:[[cell DNA] objectAtIndex:i]]){
            ++result;
        }
    }
    return result;
}

@end
