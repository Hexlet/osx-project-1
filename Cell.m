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
    //CellSymbol symbol;
    NSUInteger max_variants = [symbols count] - 1;
    
    NSString *symbol;
    int ix;
    
    for (int i = 0; i < CELL_ARRAY_CAPACITY; ++i) {
        ix = arc4random() % max_variants;
        symbol = [self getRandomSymbol];
        [_dna insertObject:symbol atIndex:i];
    }
}

-(int) hammingDistance:(Cell*) cell {
    
    int diff = 0;
    
    for (int i = 0; i < CELL_ARRAY_CAPACITY; ++i) {
        diff += ( [_dna objectAtIndex:i] == [[cell dna] objectAtIndex:i] ) ? 0 : 1;
    }
    
    return diff;
}

-(NSString*)getRandomSymbol {
    return [symbols objectAtIndex:(arc4random() % ( [symbols count] - 1 ))];
}

@end


@implementation Cell(mutator)

-(void)mutate:(int) x {
    int max_replacements = round( CELL_ARRAY_CAPACITY * x / 100);
    
    NSMutableArray *replaced_pos = [[NSMutableArray alloc] initWithCapacity: max_replacements];
    
    NSNumber *random_pos = [NSNumber numberWithInteger:-1];
    
    for ( int i = 0; i < max_replacements; ++i ) {
        while(
              [random_pos intValue] == -1 ||
              [replaced_pos containsObject:random_pos]
        ) {
            random_pos = [NSNumber numberWithInteger: arc4random() % CELL_ARRAY_CAPACITY];
            [_dna replaceObjectAtIndex:[random_pos intValue] withObject:[self getRandomSymbol]];
        }
        [replaced_pos addObject:random_pos];
    }
}

@end