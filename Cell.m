//
//  Cell.m
//  HexletDNA
//
//  Created by 4pcbr on 11/1/12.
//  Copyright (c) 2012 4pcbr. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];

    symbols = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
    
    _dna = [[NSMutableArray alloc] initWithCapacity: CELL_ARRAY_CAPACITY];
    
    [self initDna];
    
    return self;
}

-(void)initDna {
    long max_variants = [symbols count];
    
    NSString *symbol;
    int ix;
    
    for (int i = 0; i < CELL_ARRAY_CAPACITY; ++i) {
        ix = arc4random_uniform( (int)max_variants );
        symbol = [self getRandomSymbol];
        [_dna insertObject:symbol atIndex:i];
    }
}

-(int) hammingDistance:(Cell*) cell {
    
    int diff = 0;
    
    for (int i = 0; i < CELL_ARRAY_CAPACITY; ++i) {
        diff += ( [[_dna objectAtIndex:i] isEqualTo: [[cell dna] objectAtIndex:i]] ) ? 0 : 1;
    }
    
    return diff;
}

-(NSString*)getRandomSymbol {
    return [symbols objectAtIndex:arc4random_uniform( (int)[symbols count] )];
}

@end
