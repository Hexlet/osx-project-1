//
//  Cell.m
//  DNA2
//
//  Created by Alexey Fedotov on 04.11.12.
//  Copyright (c) 2012 Alexey Fedotov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init{
    self = [super init];
    if (self) {
        _source = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        _DNA = [self createDNA];
    }
    return self;
}

-(id)createDNA{
    
    //Create DNA of cell
    
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:100];

    for (int i = 0; i<100; ++i) {
        [arr addObject:[_source objectAtIndex:arc4random() % 4]];
    }
    
    return arr;
}


-(int)hammingDistance: (Cell *) cell{
    int value = 0;
    
    for (int i = 0; i<100; ++i) {
        if ([[cell DNA] objectAtIndex:i] != [_DNA objectAtIndex:i]) {
            ++value;
        }
    }
    
    return value;
}

@end
