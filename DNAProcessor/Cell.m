//
//  Cell.m
//  DNAProcessor
//
//  Created by Sergey Nebolsin on 10.11.12.
//  Copyright (c) 2012 Sergey Nebolsin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

+(Cell *) cell {
    return [[Cell alloc] init];
}

-(id) init {
    self = [super init];
    if (self) {
        _nucleicBases = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        _dna = [NSMutableArray arrayWithCapacity:100];
        while (_dna.count < 100) {
            [_dna addObject:[_nucleicBases objectAtIndex:arc4random_uniform(4)]];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)anotherCell {
    int distance = 0;
    for(int i = 0; i < 100; i++) {
        if (![[self.dna objectAtIndex:i] isEqualToString:[anotherCell.dna objectAtIndex:i]]) {
            distance++;
        }
    }
    return distance;
}

-(void) print {
    NSMutableString *result = [NSMutableString stringWithCapacity:100];
    
    for(NSString *element in _dna) {
        [result appendString:element];
    }
    
    NSLog(@"DNA: %@", result);
}

@end
