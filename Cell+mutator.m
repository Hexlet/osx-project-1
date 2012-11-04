//
//  Cell+mutator.m
//  HexletDNA
//
//  Created by 4pcbr on 11/4/12.
//  Copyright (c) 2012 4pcbr. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void)mutate:(int) x {
    int max_replacements = round( (float)CELL_ARRAY_CAPACITY * (float)x / 100.0f);
    
    NSMutableArray *replaced_pos = [[NSMutableArray alloc] initWithCapacity: max_replacements];
    
    NSNumber *random_pos = [NSNumber numberWithInteger:-1];
    
    NSLog(@"Initial cell DNA: %@", [self toString]);
    
    for ( int i = 0; i < max_replacements; ++i ) {
        while(
              [random_pos intValue] == -1 ||
              [replaced_pos containsObject:random_pos]
              ) {
            random_pos = [NSNumber numberWithInteger: arc4random() % CELL_ARRAY_CAPACITY];
            [[self dna] replaceObjectAtIndex:[random_pos intValue] withObject:[self getRandomSymbol]];
        }
        [replaced_pos addObject:random_pos];
    }
    
    NSLog(@"Mutated cell DNA: %@", [self toString]);
}

-(NSString*)toString {
    return [[self dna] componentsJoinedByString: @" "];
}

@end
