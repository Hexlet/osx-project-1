//
//  Cell.m
//  DNA
//
//  Created by Alexander Madyankin on 04.11.12.
//  Copyright (c) 2012 Alexander Madyankin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

+ (NSString*) randomBase {
    NSString *bases = @"ATGC";
    return [NSString stringWithFormat: @"%C", [bases characterAtIndex: arc4random() % [bases length]]];
}


- (id) init {
    self = [super init];
    if (self) {
        _capacity = 100;
        _dna = [[NSMutableArray alloc] initWithCapacity: _capacity];
        
        for (int i = 0; i < _capacity; i++) {
            [_dna addObject: [Cell randomBase]];
        }
    }
    return self;
}


- (int) hammingDistance: (Cell *) anotherCell {
    int distance = 0;

    for (int i = 0; i < _capacity; i++) {
        if (self.dna != anotherCell.dna) {
            distance++;
        }
    }
    
    return distance;
}


- (void) print {
    NSLog(@"%@", [[_dna valueForKey: @"description"] componentsJoinedByString: @""]);
}

@end
