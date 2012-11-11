//
//  Cell.m
//  DNA
//
//  Created by Evgeny on 05.11.12.
//  Copyright (c) 2012 Evgeny. All rights reserved.
//

#import "Cell.h"

@implementation Cell

int sizeArray = 100;

-(id) init {
    self = [super init];
    if (self) {
        
        
        _types = [NSMutableArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        _DNA = [NSMutableArray arrayWithCapacity:100];
        
        for (sizeArray = 0; sizeArray < 100; sizeArray++) {
            [_DNA addObject:_types[arc4random() %4]];
        }
    }
    return self;
}


-(int) hammingDistance:(Cell *)cell {
    int hamming = 0;
    
    for (sizeArray = 0; sizeArray < 100; sizeArray++) {
        if (_DNA [sizeArray] != cell.DNA[sizeArray]) {
            hamming++;
        }
    }
    return hamming;
}

- (NSString *) findGenNot:(NSString *)current {
    NSString *gen = [[NSString alloc] init];
        while (gen != current){
            gen = self.types[arc4random() % 4];
        }
    return gen;
}

@end
