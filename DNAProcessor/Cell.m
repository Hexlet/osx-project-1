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
        _dna = [NSMutableArray array];
        for(int i = 0; i < 100; i++) {
            [_dna addObject:[_nucleicBases objectAtIndex:random() % 4]];
        }
    }
    return self;
}

-(void) print {
    NSMutableString *result = [NSMutableString stringWithCapacity:100];
    
    for(NSString *element in _dna) {
        [result appendString:element];
    }
    
    NSLog(@"DNA: %@", result);
}

@end
