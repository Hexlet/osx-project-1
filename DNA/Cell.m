//
//  Cell.m
//  DNA
//
//  Created by ilya on 11/2/12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init {

    self = [super init];    
    
    int i;
    
    _types = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
    _DNA = [NSMutableArray arrayWithCapacity: 100];
    
    for (i=0; i < 100; i++) {
        [_DNA addObject: _types[arc4random() % 3]];
    }
    
    return self;
}

- (int) hammingDistance: (Cell *) c {
    
    int hamming = 0;
    
    for (int i = 0; i < 100; i++) {
        if(_DNA[i] != c.DNA[i]){
            hamming++;
        }
    }
    
    return hamming;
    
}

- (NSString *) findGenNot:(NSString *)current {
    
    NSString *gen = [[NSString alloc] init];
    
    while (gen != current){
        gen = self.types[arc4random() % 3];
    }
    
    return gen;
}

@end
